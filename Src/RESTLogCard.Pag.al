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
                field(User; User)
                {
                    ApplicationArea = All;
                }
            }
            Group(Request)
            {
                field(RequestBodySize; RequestBodySize)
                {
                    ApplicationArea = All;
                }
                field(RequestHeaders; RequestHeaders)
                {
                    ApplicationArea = All;
                }
            }
            group(Response)
            {
                field(ResponseHttpStatusCode; ResponseHttpStatusCode)
                {
                    ApplicationArea = All;
                }
                field(ResponseSize; ResponseSize)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
