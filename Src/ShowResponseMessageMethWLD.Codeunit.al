codeunit 79913 "ShowResponseMessage Meth WLD"
{
    procedure ShowResponseMessage(var Log: Record "REST Log WLD");
    var
        Handled: Boolean;
    begin
        OnBeforeShowResponseMessage(Log, Handled);

        DoShowResponseMessage(Log, Handled);

        OnAfterShowResponseMessage(Log);
    end;

    local procedure DoShowResponseMessage(var Log: Record "REST Log WLD"; var Handled: Boolean);
    var
        Instr: Instream;
        ResponseMessage: Text;
        TempText: Text;
        CRLF: Text[2];
    begin

        if Handled then
            exit;

        CRLF[1] := 13;
        CRLF[2] := 10;

        log.CalcFields(Response);
        log.Response.CreateInStream(Instr);
        // Instr.ReadText(RequestMessage);

        //show only 50,000 line
        while (not Instr.EOS) and (StrLen(ResponseMessage) < 50000) do begin
            Instr.ReadText(TempText);
            if (strlen(ResponseMessage) > 0) then
                ResponseMessage := ResponseMessage + CRLF + TempText
            else
                ResponseMessage := TempText;
        end;


        Message(ResponseMessage);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowResponseMessage(var Log: Record "REST Log WLD"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowResponseMessage(var Log: Record "REST Log WLD");
    begin
    end;
}