page 60248 LatestSaleOrder
{
    CardPageID = "Sales Order";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableTemporary = false;
    SourceTableView = SORTING("Document Type", "No.") ORDER(Descending) WHERE("No." = FILTER('*14-15*'&'<>*/L*'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field("Document Type"; "Document Type")
                {
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNextRecord(Steps: Integer): Integer;
    begin
        //MESSAGE(FORMAT(Steps));
        EXIT(Steps);
    end;

    trigger OnOpenPage();
    begin
        NEXT := 2;
        FINDLAST;
    end;
}

