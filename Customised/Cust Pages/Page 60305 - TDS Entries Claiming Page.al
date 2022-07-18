page 60305 "TDS Entries Claiming Page"
{
    PageType = List;
    Permissions = TableData "G/L Entry" = rm;
    SourceTable = "G/L Entry";
    SourceTableView = SORTING("G/L Account No.", "Posting Date") ORDER(Ascending) WHERE("G/L Account No."=CONST('24634..24639'),Amount=FILTER(>0),"GST TDS Claimed Date"=FILTER(''));

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
            repeater(Group)
            {
                field(GSTTDSNUMBER;GSTTDSNUMBER)
                {
                    Caption = 'GST TDS Number';
                    Editable = false;
                }
                field("CUstomer Number";"CUstomer Number")
                {
                    Caption = 'Customer Numner';
                    Editable = false;
                }
                field("Customer Name";"Customer Name")
                {
                    Caption = 'Customer Name';
                    Editable = false;
                }
                field("G/L Account No.";"G/L Account No.")
                {
                    Editable = false;
                }
                field("G/L Account Name";"G/L Account Name")
                {
                }
                field("System Date";"System Date")
                {
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Document Type";"Document Type")
                {
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Amount;Amount)
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("User ID";"User ID")
                {
                    Editable = false;
                }
                field("Source Code";"Source Code")
                {
                    Editable = false;
                }
                field("Source No.";"Source No.")
                {
                    Editable = false;
                }
                field("Sale Order No.";"Sale Order No.")
                {
                    Editable = false;
                }
                field("GST TDS Claimed Date";"GST TDS Claimed Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        GLE.RESET;
        GLE.SETFILTER("G/L Account No.",'%1|%2','20300','20400');
        GLE.SETFILTER("Document No.",Rec."Document No.");
        IF GLE.FINDSET THEN
            BEGIN
              "CUstomer Number" := GLE."Source No.";
              Cust.RESET;
              Cust.SETFILTER("No.","CUstomer Number");
              IF Cust.FINDFIRST THEN
                BEGIN
                  "Customer Name" := Cust.Name;
                  GSTTDSNUMBER := Cust."GST TDS Number";
                END;

            END;
    end;

    trigger OnOpenPage();
    begin
        // Written by Vishnu Priya on 15-02-2019

        IF USERID IN ['EFFTRONICS\SUJANI','EFFTRONICS\RAJANI','EFFTRONICS\SITARAJYAM','EFFTRONICS\ASWINI','EFFTRONICS\VISHNUPRIYA'] THEN
          CurrPage.EDITABLE := TRUE
        ELSE
          CurrPage.EDITABLE := FALSE;

    end;

    var
        "CUstomer Number" : Code[15];
        Cust : Record Customer;
        GLE : Record "G/L Entry";
        GSTTDSNUMBER : Code[30];
        "Customer Name" : Text[100];
        GLE1 : Record "G/L Entry";
}

