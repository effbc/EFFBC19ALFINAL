pageextension 70310 "Prod.Order ComponentsExt" extends "Prod. Order Components"
{
    layout
    {
        // Add changes to page layout here
        addafter(Control1)
        {
            field("Prod. Order No."; Rec."Prod. Order No.")
            {

            }
            field(Status; Rec.Status)
            {

            }
            field("Product Group Code"; Rec."Product Group Code")
            {

            }
            field("Type of Solder"; Rec."Type of Solder")
            {

            }
            field("Don't Consider"; Rec."Don't Consider")
            {
                ;
            }
            field("Line No."; Rec."Line No.")
            {

            }
            field("Prod. Order Line No."; Rec."Prod. Order Line No.")
            {

            }
            field("Material Required Day"; Rec."Material Required Day")
            {

            }
            field("Production Plan Date"; Rec."Production Plan Date")
            {


            }
            field("Material Requisition Date"; Rec."Material Requisition Date")
            {

            }
            field(PCB; Rec.PCB)
            {

            }
            field("Source No."; Rec."Source No.")
            {

            }
            field("Act. Consumption (Qty)"; Rec."Act. Consumption (Qty)")
            {

            }
            field("BOM Type"; Rec."BOM Type")
            {

                Enabled = TRUE;
                Editable = TRUE;
            }



        }
        addafter("Expected Quantity")
        {
            field("Qty. in Material Issues"; Rec."Qty. in Material Issues")
            {

            }
            field("Qty. in Posted Material Issues"; Rec."Qty. in Posted Material Issues")
            {

            }
        }
        addafter("Substitution Available")
        {
            field("Operation No."; Rec."Operation No.")
            {

            }
            field(Dept; Rec.Dept)
            {

            }
            field("Type of Solder2"; Rec."Type of Solder2")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}