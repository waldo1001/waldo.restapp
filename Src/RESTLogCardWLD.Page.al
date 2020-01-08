page 79910 "REST Log Card WLD"
{
    PageType = Card;
    SourceTable = "REST Log WLD";
    Caption = 'REST Log';
    Editable = false;

    layout
    {
        area(content)
        {
            Group(General)
            {
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
                field(User; User)
                {
                    Tooltip = 'Specifies the User';
                    ApplicationArea = All;
                }
            }
            Group(Request)
            {
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
            }
            group(Response)
            {
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
            }
        }
    }

}
