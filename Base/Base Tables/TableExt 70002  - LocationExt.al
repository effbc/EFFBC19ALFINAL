tableextension 70002 CustLocationExt extends Location
{
    fields
    {
        field(50500; "User Name"; Text[250])
        {
            Caption = 'User Name';
            Description = 'E-INV';
            DataClassification = CustomerContent;
        }
        field(50501; Password; Text[250])
        {
            Caption = 'Password';
            Description = 'E-INV';
            DataClassification = CustomerContent;
        }
        field(60001; "QC Enabled Location"; Boolean)
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
        field(60002; Stores; Option)
        {
            OptionMembers = STR,"CS STR","RD STR","PRD STR",SCRAP;
            DataClassification = CustomerContent;
        }
        field(60010; "E-Way Bill User Name"; Text[250])
        {
            Caption = 'User Name';
            DataClassification = CustomerContent;
        }
        field(60011; "E-Way Bill Password"; Text[250])
        {
            Caption = 'Password';
            DataClassification = CustomerContent;
        }
        field(60012; "T.I.N. No.1"; Code[30])
        {
            DataClassification = CustomerContent;
        }
    }
}

