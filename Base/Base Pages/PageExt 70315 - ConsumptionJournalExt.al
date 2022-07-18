pageextension 70315 ConsumptionJournalExt extends "Consumption Journal"
{
    layout
    {
        addafter(CurrentJnlBatchName)
        {
            field("Divide-by-Qty."; "Divide-by-Qty.")
            {
                Caption = 'Divide by Qty.';
                DecimalPlaces = 0 : 5;
            }
        }
        addafter("Order Line No.")
        {
            field("Source Type"; Rec."Source Type")
            {

            }
        }
        addafter("Prod. Order Comp. Line No.")
        {
            field("Sales Order No"; Rec."Sales Order No")
            {

            }
            field("Sales Order Line No"; Rec."Sales Order Line No")
            {

            }
            field("Schedule Line No"; Rec."Schedule Line No")
            {

            }
            field("Work Center No."; Rec."Work Center No.")
            {

            }
        }
        addafter("Document Date")
        {
            field("Reason Code"; Rec."Reason Code")
            {

            }
            field("Location Code 2"; Rec."Location Code")
            {

            }
        }
        addafter("Document No.")
        {
            field("Source No."; Rec."Source No.")
            {

            }
        }
        addafter(ProdOrderDescription)
        {
            field(WorkDate; WorkDate)
            {
                Editable = false;
            }
        }
    }

    actions
    {
        addafter("Calc. Co&nsumption")
        {
            action("Calc. &Rework. Consumption")
            {
                Caption = 'Calc. &Rework. Consumption';
                Image = CalculateConsumption;
                trigger OnAction()
                var
                    CalcConsumption1: Report 33000265;
                begin
                    CalcConsumption1.SetTemplateAndBatchName(Rec."Journal Template Name", Rec."Journal Batch Name");
                    CalcConsumption1.RUNMODAL;
                end;
            }
            action("Calc. &Schedule Components")
            {
                Caption = 'Calc. &Schedule Components';
                Image = CalculateLines;
                trigger OnAction()
                begin
                    Rec.CopyScheduleItems;
                end;
            }
            action("Assign Itemtracking")
            {
                Caption = 'Assign Itemtracking';
                Image = ItemTracking;
                trigger OnAction()
                BEGIN

                    /* AssignItemtracking."AssignSerial&LotnosCon"("Journal Template Name","Journal Batch Name");
                    CurrPage.UPDATE(FALSE); */

                    AssignItemtracking.ConsumptionItemTracking(Rec."Journal Template Name", Rec."Journal Batch Name");
                    CurrPage.UPDATE(FALSE);
                END;
            }
            action("Calculate Quantity")
            {
                Caption = 'Calculate Quantity';
                Image = InventoryCalculation;
                trigger OnAction()
                var
                    ItemJrnlLineRec: Record "Item Journal Line";
                begin
                    ItemJrnlLineRec.SETRANGE("Journal Template Name", Rec."Journal Template Name");
                    ItemJrnlLineRec.SETRANGE("Journal Batch Name", Rec."Journal Batch Name");
                    IF ItemJrnlLineRec.FINDSET THEN
                            REPEAT
                                IF (ItemJrnlLineRec.Quantity > 1) AND ("Divide-by-Qty." <> 0) THEN BEGIN
                                    ItemJrnlLineRec.VALIDATE(Quantity, (ItemJrnlLineRec.Quantity / "Divide-by-Qty."));
                                    ItemJrnlLineRec.MODIFY;
                                END;
                            UNTIL ItemJrnlLineRec.NEXT = 0;
                    "Divide-by-Qty." := 0;
                    CurrPage.UPDATE(FALSE);
                end;
            }
            action("Calc.Alternate Consumption")
            {
                Caption = 'Calc.Alternate Consumption';
                Image = CalculateConsumption;
                trigger OnAction()
                begin
                    CLEAR(CalcAlternateConsumption);
                    CalcAlternateConsumption.SetTemplateAndBatchName(Rec."Order No.", Rec."Order Line No.", Rec."Journal Template Name",
                                                 Rec."Journal Batch Name", Rec."Document No.");

                    CalcAlternateConsumption.RUNMODAL;
                end;
            }
            action("Assign consumption serial no")
            {
                Image = SerialNo;
                trigger OnAction()
                begin
                    XMLPORT.RUN(XMLPORT::Consumptions);
                end;
            }
        }
    }

    var

        AssignItemtracking: Codeunit "Assigning Serial & Lot Numbers";
        "Divide-by-Qty.": Decimal;
        CalcAlternateConsumption: Report "Calc Alternate Consumption23";

    PROCEDURE CheckTracking(VAR Rec: Record "Item Journal Line");
    VAR
        ReservationEntry: Record "Reservation Entry";
    BEGIN
        //b2b EFF
        ReservationEntry.SETRANGE("Source ID", Rec."Journal Template Name");
        ReservationEntry.SETRANGE("Source Batch Name", Rec."Journal Batch Name");
        ReservationEntry.SETRANGE("Source Ref. No.", Rec."Line No.");
        ReservationEntry.SETRANGE("Item No.", Rec."Item No.");
        IF ReservationEntry.FINDFIRST THEN
            ERROR('You can not Delete the Lines');
    END;
}