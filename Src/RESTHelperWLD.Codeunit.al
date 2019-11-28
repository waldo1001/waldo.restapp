codeunit 79911 "REST Helper WLD"
{
    Access = Public;
    //TODO: Build in RequestCatcher.com functionality so that it's easy to analyze requests that come from Business Central

    var
        WebClient: HttpClient;
        WebRequest: HttpRequestMessage;
        WebResponse: HttpResponseMessage;
        WebRequestHeaders: HttpHeaders;
        WebContentHeaders: HttpHeaders;
        WebContent: HttpContent;
        CurrentContentType: Text;
        RestHeaders: TextBuilder;
        ContentTypeSet: Boolean;

    procedure Initialize(Method: Text; URI: Text);
    begin
        WebRequest.Method := Method;
        WebRequest.SetRequestUri(URI);

        WebRequest.GetHeaders(WebRequestHeaders);
    end;

    procedure AddRequestHeader(HeaderKey: Text; HeaderValue: Text)
    begin
        RestHeaders.AppendLine(HeaderKey + ': ' + HeaderValue);

        WebRequestHeaders.Add(HeaderKey, HeaderValue);
    end;

    procedure AddBody(Body: Text)
    begin
        WebContent.WriteFrom(Body);

        ContentTypeSet := true;
    end;

    procedure SetContentType(ContentType: Text)
    begin
        CurrentContentType := ContentType;

        webcontent.GetHeaders(WebContentHeaders);
        if WebContentHeaders.Contains('Content-Type') then
            WebContentHeaders.Remove('Content-Type');
        WebContentHeaders.Add('Content-Type', ContentType);
    end;

    procedure Send() SendSuccess: Boolean
    var
        StartDateTime: DateTime;
        TotalDuration: Duration;
    begin
        if ContentTypeSet then
            WebRequest.Content(WebContent);

        OnBeforeSend(WebRequest, WebResponse);
        StartDateTime := CurrentDateTime();
        SendSuccess := WebClient.Send(WebRequest, WebResponse);
        TotalDuration := CurrentDateTime() - StartDateTime;
        OnAfterSend(WebRequest, WebResponse);

        if SendSuccess then
            if not WebResponse.IsSuccessStatusCode() then
                SendSuccess := false;

        Log(StartDateTime, TotalDuration);
    end;

    procedure GetResponseContentAsText() ResponseContentText: Text
    var
        RestBlob: record "REST Blob WLD";
        Instr: Instream;
    begin

        RESTBlob.Blob.CreateInStream(Instr);
        WebResponse.Content().ReadAs(ResponseContentText);
    end;

    procedure GetResponseReasonPhrase(): Text
    begin
        exit(WebResponse.ReasonPhrase());
    end;

    procedure GetHttpStatusCode(): Integer
    begin
        exit(WebResponse.HttpStatusCode());
    end;

    local procedure Log(StartDateTime: DateTime; TotalDuration: Duration)
    var
        RESTLog: Record "REST Log WLD";
        RestBlob: record "REST Blob WLD";
        ResponseBlob: record "REST Blob WLD";
        Instr: InStream;
        ResponseInstr: InStream;
        Outstr: OutStream;
    begin
        RestBlob.BLOB.CreateInStream(Instr);
        WebContent.ReadAs(Instr);

        ResponseBlob.BLOB.CreateInStream(ResponseInstr);
        WebResponse.Content().ReadAs(ResponseInstr);

        with RESTLog do begin
            Init();
            RequestUrl := copystr(WebRequest.GetRequestUri(), 1, MaxStrLen(RequestUrl));
            RequestMethod := copystr(WebRequest.Method(), 1, MaxStrLen(RequestMethod));

            RequestBody.CreateOutStream(Outstr);
            CopyStream(Outstr, Instr);

            RequestBodySize := RequestBody.Length();
            ContentType := copystr(CurrentContentType, 1, MaxStrLen(ContentType));
            RequestHeaders := copystr(RestHeaders.ToText(), 1, MaxStrLen(RequestHeaders));
            ResponseHttpStatusCode := GetHttpStatusCode();

            Response.CreateOutStream(Outstr);
            CopyStream(Outstr, ResponseInstr);
            ResponseSize := Response.Length();
            DateTimeCreated := StartDateTime;

            User := copystr(userid(), 1, MaxStrLen(User));

            Duraction := TotalDuration;
            Insert();
        end;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeSend(WebRequest: HttpRequestMessage; WebResponse: HttpResponseMessage)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterSend(WebRequest: HttpRequestMessage; WebResponse: HttpResponseMessage)
    begin
    end;
}