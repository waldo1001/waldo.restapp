page 79911 "REST Log List WLD"
{
    PageType = List;
    SourceTable = "REST Log WLD";
    Caption = 'REST Log List';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Rest Log Card WLD";
    SourceTableView = sorting("Entry No.") order(descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; "Entry No.")
                {
                    Tooltip = 'Specifies the Entry No.';
                    ApplicationArea = All;
                }
                field(RequestMethod; RequestMethod)
                {
                    Tooltip = 'Specifies the RequestMethod';
                    ApplicationArea = All;
                }
                field(RequestUrl; RequestUrl)
                {
                    Tooltip = 'Specifies the RequestUrl';
                    ApplicationArea = All;
                }
                field(ContentType; ContentType)
                {
                    Tooltip = 'Specifies the ContentType';
                    ApplicationArea = All;
                }
                field(DateTimeCreated; DateTimeCreated)
                {
                    Tooltip = 'Specifies the DateTimeCreated';
                    ApplicationArea = All;
                }
                field(Duraction; Duraction)
                {
                    Tooltip = 'Specifies the Duraction';
                    ApplicationArea = All;
                }
                field(RequestBodySize; RequestBodySize)
                {
                    Tooltip = 'Specifies the RequestBodySize';
                    ApplicationArea = All;
                }
                field(RequestHeaders; RequestHeaders)
                {
                    Tooltip = 'Specifies the RequestHeaders';
                    ApplicationArea = All;
                }
                field(ResponseHttpStatusCode; ResponseHttpStatusCode)
                {
                    Tooltip = 'Specifies the ResponseHttpStatusCode';
                    ApplicationArea = All;
                }
                field(ResponseSize; ResponseSize)
                {
                    Tooltip = 'Specifies the ResponseSize';
                    ApplicationArea = All;
                }
                field(User; User)
                {
                    Tooltip = 'Specifies the User';
                    ApplicationArea = All;
                }


            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ShowRequestMessage)
            {
                Tooltip = 'Shows the request message';
                ApplicationArea = All;
                Image = ShowSelected;
                Caption = 'Show Request Message';
                Scope = "Repeater";

                trigger OnAction()
                begin
                    ShowRequestMessage();
                end;
            }
            action(ShowResponseMessage)
            {
                Tooltip = 'Shows the response message';
                ApplicationArea = All;
                Image = ShowSelected;
                Caption = 'Show Response Message';
                Scope = "Repeater";

                trigger OnAction()
                begin
                    ShowResponseMessage();
                end;
            }
        }
    }

}
