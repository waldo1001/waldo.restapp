codeunit 79912 "ShowRequestMessage Meth WLD"
{
    procedure ShowRequestMessage(var Log: Record "REST Log WLD");
    var
        Handled: Boolean;
    begin
        OnBeforeShowRequestMessage(Log, Handled);

        DoShowRequestMessage(Log, Handled);

        OnAfterShowRequestMessage(Log);
    end;

    local procedure DoShowRequestMessage(var Log: Record "REST Log WLD"; var Handled: Boolean);
    var
        Instr: Instream;
        RequestMessage: Text;
        TempText: Text;
        CRLF: Text[2];
    begin

        if Handled then
            exit;

        CRLF[1] := 13;
        CRLF[2] := 10;

        log.CalcFields(RequestBody);
        log.RequestBody.CreateInStream(Instr);
        // Instr.ReadText(RequestMessage);

        //show only 50,000 line
        while (not Instr.EOS) and (StrLen(RequestMessage) < 50000) do begin
            Instr.ReadText(TempText);
            if (strlen(RequestMessage) > 0) then
                RequestMessage := RequestMessage + CRLF + TempText
            else
                RequestMessage := TempText;
        end;

        Message(RequestMessage);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowRequestMessage(var Log: Record "REST Log WLD"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowRequestMessage(var Log: Record "REST Log WLD");
    begin
    end;
}