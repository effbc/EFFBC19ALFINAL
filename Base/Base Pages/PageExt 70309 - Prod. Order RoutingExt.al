pageextension 70309 "Prod. Order RoutingExt" extends "Prod. Order Routing"
{
    layout
    {
        // Add changes to page layout here
        addafter(Control1)
        {
            field("Routing No."; Rec."Routing No.")
            {
                //DataClassification = ToBeClassified;
            }
            field("Routing Reference No."; Rec."Routing Reference No.")
            {

            }
            field(PlannedStartDate; Rec.PlannedStartDate)
            {

            }
            field("Item Description"; Rec."Item Description")
            {

            }
            field("Input Quantity"; Rec."Input Quantity")
            {

            }
            field("Item No."; Rec."Item No.")
            {

            }
            field("QAS/MPR"; Rec."QAS/MPR")
            {

            }
            field("Operation Description"; Rec."Operation Description")
            {

            }
            field("Allocated Qty.1"; Rec."Allocated Qty.1")
            {

            }
            field("Person.2"; Rec."Person.2")
            {

            }
            field("Allocated Qty.2"; Rec."Allocated Qty.2")
            {

            }
            field("Person.3"; Rec."Person.3")
            {

            }
            field("Allocated Qty.3"; Rec."Allocated Qty.3")
            {

            }

            field("Work Center No."; Rec."Work Center No.")
            {

            }
            field("Work Center Group Code"; Rec."Work Center Group Code")
            {

            }
        }
        addafter("Schedule Manually")
        {
            field("QC Enabled"; Rec."QC Enabled")
            {
                trigger OnValidate()
                var
                    myInt: Integer;
                    CapacityLedgerEntrY: Record "Capacity Ledger Entry";
                begin
                    CapacityLedgerEntrY.SETRANGE(CapacityLedgerEntrY."Order No.", Rec."Prod. Order No.");
                    CapacityLedgerEntrY.SETRANGE("Order Line No.", Rec."Routing Reference No.");
                    CapacityLedgerEntrY.SETRANGE("Operation No.", Rec."Operation No.");
                    IF CapacityLedgerEntrY.FINDFIRST THEN
                        IF CapacityLedgerEntrY."Last Output Line" THEN
                            ERROR('You can not change this field as already ledger entries are existed with this operation');
                    //B2B1.1
                end;

            }
            field("Spec Id"; Rec."Spec Id")
            {
                Editable = FALSE;
            }
            field("Quantity Sent To Quality"; Rec."Quantity Sent To Quality")
            {

            }
            field("Sub Assembly"; Rec."Sub Assembly")
            {
                ;
            }
        }
        addafter("Starting Date")
        {
            field("Quantity Accepted"; Rec."Quantity Accepted")
            {

            }
            field("Quantity Rejected"; Rec."Quantity Rejected")
            {

            }
            field("Quantity Rework"; Rec."Quantity Rework")
            {

            }
        }

    }

    actions
    {

        // Add changes to page actions here
        addafter("Order &Tracking")
        {
            group("Inspection")
            {
                action("Inspection Data Sheets")
                {

                    RunObject = Page "Inspection Data Sheet List";
                    RunPageLink = "Source Type" = CONST(WIP), "Prod. Order No." = FIELD("Prod. Order No."), "Routing Reference No." = FIELD("Routing Reference No."), "Routing No." = FIELD("Routing No."), "Operation No." = FIELD("Operation No.");


                }


                action("Posted Inspection Data Sheets")
                {
                    ApplicationArea = All;
                    // CaptionML=ENU=Posted Inspection Data Sheets;
                    RunObject = Page "Posted Inspect Data Sheet List";
                    RunPageLink = "Source Type" = CONST(WIP), "Prod. Order No." = FIELD("Prod. Order No."), "Routing Reference No." = FIELD("Routing Reference No."), "Routing No." = FIELD("Routing No."), "Operation No." = FIELD("Operation No.");


                    trigger OnAction()
                    begin

                    end;
                }
                action("Posted I&nspection Receipts")
                {
                    ApplicationArea = All;

                    RunObject = Page "Inspection Receipt List";

                    RunPageLink = "Source Type" = CONST(WIP), "Prod. Order No." = FIELD("Prod. Order No."), "Routing Reference No." = FIELD("Routing Reference No."), "Routing No." = FIELD("Routing No."), "Operation No." = FIELD("Operation No."), Status = CONST(true);

                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }

    var
        myInt: Integer;

}