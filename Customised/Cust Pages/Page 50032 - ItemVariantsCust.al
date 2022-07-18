page 50032 "Item Variants Cust"
{
    Caption = 'Item Variants';
    DataCaptionFields = "Item No.";
    PageType = List;
    SourceTable = "Item Variant Cust";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                    Visible = false;
                }
                field(Make; Make)
                {
                }
                field("Operating Temperature"; "Operating Temperature")
                {
                }
                field("Storage Temperature"; "Storage Temperature")
                {
                }
                field("Part No"; "Part No")
                {
                }
                field(Package; Package)
                {
                }
                field(Priority; Priority)
                {
                }
                field(Description; Description)
                {
                    Visible = false;
                }
                field("Item Status"; "Item Status")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("V&ariant")
            {
                Caption = 'V&ariant';
                Image = ItemVariant;
                action(Translations)
                {
                    Caption = 'Translations';
                    Image = Translations;
                    RunObject = Page "Item Translations";
                    RunPageLink = "Item No." = FIELD("Item No."), "Variant Code" = FIELD(Make);
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        /*
        IF UPPERCASE(USERID) IN ['EFFTRONICS\PARVATHI','EFFTRONICS\VIJAYA','SUPER','EFFTRONICS\ANUSHAG','EFFTRONICS\RAMALAKSHMI','EFFTRONICS\KARUNA','EFFTRONICS\NAGAGAYATRI','EFFTRONICS\SUPRIYA']  THEN
          CurrPage.EDITABLE:= TRUE
        ELSE
          CurrPage.EDITABLE:= FALSE;
        */

        //added by Vishnu Priya on 10-08-2019
        IF NOT (SMTP_MAIL.Permission_Checking(USERID, 'ITEM-VARIENT-RIGHTS'))
          THEN
            CurrPage.EDITABLE := FALSE
        ELSE
            CurrPage.EDITABLE := TRUE;
        //end by Vishnu Priya on 10-08-2019

    end;

    var
        SMTP_MAIL: Codeunit "Custom Events";
}

