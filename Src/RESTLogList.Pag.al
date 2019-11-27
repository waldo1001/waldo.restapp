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
                    ApplicationArea = All;
                }
                field(RequestMethod; RequestMethod)
                {
                    ApplicationArea = All;
                }
                field(RequestUrl; RequestUrl)
                {
                    ApplicationArea = All;
                }
                field(ContentType; ContentType)
                {
                    ApplicationArea = All;
                }
                field(DateTimeCreated; DateTimeCreated)
                {
                    ApplicationArea = All;
                }
                field(Duraction; Duraction)
                {
                    ApplicationArea = All;
                }
                field(RequestBodySize; RequestBodySize)
                {
                    ApplicationArea = All;
                }
                field(RequestHeaders; RequestHeaders)
                {
                    ApplicationArea = All;
                }
                field(ResponseHttpStatusCode; ResponseHttpStatusCode)
                {
                    ApplicationArea = All;
                }
                field(ResponseSize; ResponseSize)
                {
                    ApplicationArea = All;
                }
                field(User; User)
                {
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
                ApplicationArea = All;
                Image = ShowSelected;
                Promoted = true;
                PromotedCategory = Report;
                Caption = 'Show Request Message';
                Scope = "Repeater";

                trigger OnAction()
                begin
                    ShowRequestMessage();
                end;
            }
            action(ShowResponseMessage)
            {
                ApplicationArea = All;
                Image = ShowSelected;
                Promoted = true;
                PromotedCategory = Report;
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
