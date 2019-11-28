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
        RequestMessage: Text;
    begin
        if Handled then
            exit;

        log.CalcFields(Response);
        log.Response.CreateInStream(Instr);
        Instr.ReadText(RequestMessage);

        Message(RequestMessage);
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