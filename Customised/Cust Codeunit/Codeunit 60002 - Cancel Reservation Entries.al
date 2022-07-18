codeunit 60002 "Cancel Reservation Entries"
{

    trigger OnRun();
    begin
    end;

    var
        ReservEngineMgt: Codeunit 99000831;
        ReservationEntry: Record "Reservation Entry";

    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '', false, false)]

    procedure DeleteProdReservationEntries(var Rec: Record "Item Ledger Entry"; RunTrigger: Boolean);
    var
        ILE: Record "Item Ledger Entry";
    begin
        IF NOT (Rec."Entry Type" = Rec."Entry Type"::Output) THEN
            EXIT;
        ReservationEntry.RESET;
        ReservationEntry.SETCURRENTKEY(
        "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
        "Source Batch Name", "Source Prod. Order Line", "Reservation Status",
        "Shipment Date", "Expected Receipt Date");
        ReservationEntry.SETRANGE("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        ReservationEntry.SETRANGE("Disallow Cancellation", FALSE);
        ReservationEntry.SETRANGE("Source Type", DATABASE::"Item Ledger Entry");
        ReservationEntry.SETRANGE("Source Subtype", 0);
        ReservationEntry.SETRANGE("Source ID", '');
        ReservationEntry.SETRANGE("Source Batch Name", '');
        ReservationEntry.SETRANGE("Source Prod. Order Line", 0);
        ReservationEntry.SETRANGE("Source Ref. No.", Rec."Entry No.");
        IF ReservationEntry.FINDSET THEN BEGIN
            REPEAT
                CLEAR(ReservEngineMgt);
                ReservEngineMgt.CancelReservation(ReservationEntry);
            UNTIL ReservationEntry.NEXT = 0;
        END;

        ReservationEntry.RESET;
        ReservationEntry.SETCURRENTKEY(
        "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
        "Source Batch Name", "Source Prod. Order Line", "Reservation Status",
        "Shipment Date", "Expected Receipt Date");
        ReservationEntry.SETRANGE("Item No.", Rec."Item No.");
        ReservationEntry.SETFILTER("Reservation Status", '<>%1', ReservationEntry."Reservation Status"::Reservation);
        ReservationEntry.SETFILTER("Serial No.", Rec."Serial No.");
        IF ReservationEntry.FINDSET THEN BEGIN
            REPEAT
                //MESSAGE('test1');
                ReservationEntry.DELETE;
            UNTIL ReservationEntry.NEXT = 0;
        END;
    end;
}

