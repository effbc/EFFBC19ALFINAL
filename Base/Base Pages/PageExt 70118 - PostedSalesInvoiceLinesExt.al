pageextension 70118 PostedSalesInvoiceLinesExt extends "Posted Sales Invoice Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;

            }
        }
    }
}

