page 60220 "Need to Change Deviated Dates"
{
    PageType = Worksheet;
    SourceTable = "Purchase Line";
    SourceTableView = SORTING("Document Type", "Document No.", "Line No.") ORDER(Ascending) WHERE("Document Type" = CONST(Order), Type = CONST(Item), "Location Code" = CONST('STR'), "Outstanding Quantity" = FILTER(> 0));

    layout
    {
        area(content)
        {
            field("COUNT"; COUNT)
            {
            }
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Document Type"; "Document Type")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Vendor Name"; "Vendor Name")
                {
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                }
                field(Description; Description)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Outstanding Quantity"; "Outstanding Quantity")
                {
                }
                field("Deviated Receipt Date"; "Deviated Receipt Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        //SETFILTER("Deviated Receipt Date"=<format(TODAY))
        SETRANGE("Deviated Receipt Date", DMY2Date(01, 04, 11), TODAY - 1);
    end;

    var
        x: Integer;
}

