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
    begin
        if Handled then
            exit;

        log.CalcFields(RequestBody);
        log.RequestBody.CreateInStream(Instr);
        Instr.ReadText(RequestMessage);

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