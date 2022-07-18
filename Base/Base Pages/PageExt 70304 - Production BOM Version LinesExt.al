pageextension 70304 "Production BOM LinesExt" extends "Production BOM Version Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Material Reqired Day"; Rec."Material Reqired Day")
            {

            }
            field("Description 2"; Rec."Description 2")
            {

            }
        }
        addafter(Width)
        {
            field("No. of Soldering Points"; Rec."No. of Soldering Points")
            {

            }
            field("No. of Pins"; Rec."No. of Pins")
            {

            }
            field("No. of Opportunities"; Rec."No. of Opportunities")
            {

            }
            field("Type of Solder"; Rec."Type of Solder")
            {

            }
            field("Shelf No."; Rec."Shelf No.")
            {

            }
            field("No. of Fixing Holes"; Rec."No. of Fixing Holes")
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