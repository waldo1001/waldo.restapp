table 79910 "REST Blob WLD"
{
    Access = Internal;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            caption = 'Primary Key';
        }

        field(2; "BLOB"; Blob)
        {
            Caption = 'BLOB';
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}