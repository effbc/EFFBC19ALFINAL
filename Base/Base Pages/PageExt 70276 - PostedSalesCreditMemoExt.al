pageextension 70276 PostedSalesCreditMemoExt extends "Posted Sales Credit Memo"
{
    layout
    {
        modify("Sell-to Post Code")
        {
            Caption = 'Sell-to Post Code/City';
        }
        modify("Bill-to Post Code")
        {
            Caption = 'Bill-to Post Code/City';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code/City';
        }
    }

    actions
    {
        addbefore(SendCustom)
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';
                    RunObject = Page "Inspection Data Sheet List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Posted Sales Order No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';
                    RunObject = Page "Posted Inspect Data Sheet List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Posted Sales Order No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("I&nspection Receipts")
                {
                    Caption = 'I&nspection Receipts';
                    RunObject = Page "Inspection Receipt List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Posted Sales Order No." = FIELD("No."), Status = CONST(false);
                    ApplicationArea = All;
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';
                    RunObject = Page "Inspection Receipt List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Posted Sales Order No." = FIELD("No."), Status = CONST(true);
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        myInt: Integer;
}