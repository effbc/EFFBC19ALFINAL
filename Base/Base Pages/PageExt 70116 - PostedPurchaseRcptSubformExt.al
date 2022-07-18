pageextension 70116 PostedPurchaseRcptSubformExt extends "Posted Purchase Rcpt. Subform"
{
    Editable = true;
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        addafter("No.")
        {
            field(Sample; Rec.Sample)
            {
                Editable = EditableFields;
                ApplicationArea = All;
            }
            field("Store Remarks"; Rec."Store Remarks")
            {
                ApplicationArea = All;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Quantity Accepted"; Rec."Quantity Accepted")
            {
                Editable = "Quantity AcceptedEditable";
                ApplicationArea = All;
            }
            field("Quantity Rejected"; Rec."Quantity Rejected")
            {
                Editable = "Quantity RejectedEditable";
                ApplicationArea = All;
            }
            field("Unit Cost"; Rec."Unit Cost")
            {
                Editable = EditableFields;
                ApplicationArea = All;
            }
            field("QC Enabled"; Rec."QC Enabled")
            {
                Editable = EditableFields;
                ApplicationArea = All;
            }
            field("Quality Before Receipt"; Rec."Quality Before Receipt")
            {
                ApplicationArea = All;
            }
        }
        addafter("Variant Code")
        {
            field("Indent No."; Rec."Indent No.")
            {
                ApplicationArea = All;
            }
            field("Indent Line No."; Rec."Indent Line No.")
            {
                ApplicationArea = All;
            }
            field("Quantity Rework"; Rec."Quantity Rework")
            {
                Editable = "Quantity ReworkEditable";
                ApplicationArea = All;
            }
            field("Document date"; Rec."Document date")
            {
                ApplicationArea = All;
            }
        }
        addafter(Correction)
        {
            field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = All;
            }
            field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
            {
                ApplicationArea = All;
            }
            field(Make; Rec.Make)
            {
                Editable = EditableFields;
                ApplicationArea = All;
            }
            field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Order No."; Rec."Order No.")
            {
                Editable = EditableFields;
                ApplicationArea = All;
            }
            field("Order Line No."; Rec."Order Line No.")
            {
                Editable = EditableFields;
                ApplicationArea = All;
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
            field("Quantity (Base)"; Rec."Quantity (Base)")
            {
                ApplicationArea = All;
            }
            field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Order Address Code"; Rec."Order Address Code")
            {
                ApplicationArea = All;
            }
            field("Buy-From GST Registration No"; Rec."Buy-From GST Registration No")
            {
                ApplicationArea = All;
            }
            field("Item Rcpt. Entry No."; Rec."Item Rcpt. Entry No.")
            {
                ApplicationArea = All;
            }
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
            field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
            {
                ApplicationArea = All;
            }
            field("Part Number"; Rec."Part Number")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(ItemInvoiceLines)
        {
            action("Inspection &Lots")
            {
                Caption = 'Inspection &Lots';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    //This functionality was copied from page #136. Unsupported part was commented. Please check it.
                    /*CurrPage.PurchReceiptLines.Page.*/
                    ShowInspectLots;

                end;
            }
            action("Sample Lot Inspection")
            {
                Caption = 'Sample Lot Inspection';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    //This functionality was copied from page #136. Unsupported part was commented. Please check it.
                    /*CurrPage.PurchReceiptLines.Page.*/
                    _SampleLotInspection;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS', 'EFFTRONICS\RENUKACH'] THEN   //'EFFTRONICS\VISHNUPRIYA',
            EditableFields := TRUE
        ELSE
            EditableFields := FALSE;
    end;






    var
        InspectDataSheet: Record "Inspection Datasheet Header";
        PostedInspectDataSheet: Record "Posted Inspect DatasheetHeader";
        InspectReportHeader: Record "Inspection Receipt Header";
        InspectLots: Record "Inspection Lot";
        PostInspLot: Codeunit "Inspection Data Sheets";
        Text000: Label 'Inspection Data Sheets already exists for atleast one of the Inspection Lots.\Inspection Data sheets cannot be created here.';
        Text001: Label 'Inspection Data Sheet already exists for the Receipt.';

        "Quantity AcceptedEditable": Boolean;

        "Quantity RejectedEditable": Boolean;

        "Quantity ReworkEditable": Boolean;
        EditableFields: Boolean;



    procedure TrackingPage();
    begin
    end;

    LOCAL PROCEDURE UndoReceiptLine();
    VAR
        PurchRcptLine: Record "Purch. Rcpt. Line";
        IDS: Record "Inspection Datasheet Header";
        IDSL: Record "Inspection Datasheet Line";
        QILE: Record "Quality Item Ledger Entry";
        PIDS: Record "Posted Inspect DatasheetHeader";
        PIDSL: Record "Posted Inspect Datasheet Line";
        IR: Record "Inspection Receipt Header";
    BEGIN
        IF Rec."QC Enabled" = TRUE THEN BEGIN
            IDS.SETRANGE("Receipt No.", Rec."Document No.");
            IDS.SETRANGE("Purch Line No", Rec."Line No.");
            IF IDS.FINDSET THEN BEGIN
                REPEAT
                    PIDS.TRANSFERFIELDS(IDS);
                    PIDS."Quality Status" := PIDS."Quality Status"::Cancel;
                    PIDS.INSERT;
                    IDS.DELETE;
                    IDSL.SETRANGE("Document No.", IDS."No.");
                    IF IDSL.FINDSET THEN BEGIN
                        REPEAT
                            PIDSL.TRANSFERFIELDS(IDSL);
                            PIDSL.INSERT;
                        UNTIL IDSL.NEXT = 0;
                        IDSL.DELETEALL;
                    END;
                UNTIL IDS.NEXT = 0;
                QILE.SETRANGE("Document No.", IDS."Receipt No.");
                QILE.SETRANGE(QILE."Purch.Rcpt Line", Rec."Line No.");
                IF QILE.FINDSET THEN
                    REPEAT
                        QILE.DELETE;
                    UNTIL QILE.NEXT = 0;
            END;
        END;

        /* IR.SETRANGE("Receipt No.", "Document No.");
        IR.SETRANGE("Purch Line No", "Line No.");
        IR.SETFILTER(Status, 'NO');
        IF IR.FINDSET THEN BEGIN
            REPEAT
                IR.Status := TRUE;
                //IR."Quality Status" := IR."Quality Status" :: Close;
                IR.MODIFY;
            UNTIL IR.NEXT = 0;
        END;
        QILE.SETRANGE("Document No.", IR."Receipt No.");
        QILE.SETRANGE(QILE."Purch.Rcpt Line", "Line No.");
        IF QILE.FINDSET THEN
            REPEAT
                QILE.DELETE;
            UNTIL QILE.NEXT = 0;
    END; */

    end;

    procedure "---Quality control---"();
    begin
    end;


    procedure ShowDataSheet();
    begin
        InspectDataSheet.SETRANGE("Receipt No.", Rec."Document No.");
        InspectDataSheet.SETRANGE("Item No.", Rec."No.");
        InspectDataSheet.SETRANGE("Purch Line No", Rec."Line No.");
        InspectDataSheet.SETCURRENTKEY("Rework Level");
        PAGE.RUN(PAGE::"Inspection Data Sheet List", InspectDataSheet);
    end;


    procedure ShowPostedDataSheet();
    begin
        PostedInspectDataSheet.SETRANGE("Receipt No.", Rec."Document No.");
        PostedInspectDataSheet.SETRANGE("Item No.", Rec."No.");
        PostedInspectDataSheet.SETRANGE("Purch Line No", Rec."Line No.");
        PostedInspectDataSheet.SETCURRENTKEY("Rework Level");
        PAGE.RUN(PAGE::"Posted Inspect Data Sheet List", PostedInspectDataSheet);
    end;


    procedure ShowInspectReport(Status: Boolean);
    begin
        InspectReportHeader.SETRANGE("Receipt No.", Rec."Document No.");
        InspectReportHeader.SETRANGE("Purch Line No", Rec."Line No.");
        InspectReportHeader.SETFILTER(InspectReportHeader.Status, '%1', Status);
        InspectReportHeader.SETCURRENTKEY("Rework Level");
        PAGE.RUN(PAGE::"Inspection Receipt List", InspectReportHeader);
        InspectReportHeader.RESET;
    end;


    procedure ShowInspectLots();
    var
        PostPurchHead: Record "Purch. Rcpt. Header";
    begin
        Rec.TESTFIELD("QC Enabled");
        IF Rec.Type = Rec.Type::Item THEN BEGIN
            InspectLots.RESET;
            InspectLots.SETRANGE("Document No.", Rec."Document No.");
            InspectLots.SETRANGE("Purch. Line No.", Rec."Line No.");
            InspectLots.SETRANGE("Item No.", Rec."No.");
            PAGE.RUN(PAGE::"Inspection Lots", InspectLots);
        END;
    end;


    procedure CreateInpDataSheets();
    begin
        IF Rec.Type = Rec.Type::Item THEN BEGIN
            Rec.TESTFIELD("Spec ID");
            InspectLots.SETRANGE("Document No.", Rec."Document No.");
            InspectLots.SETRANGE("Purch. Line No.", Rec."Line No.");
            InspectLots.SETRANGE("Item No.", Rec."No.");
            InspectLots.SETRANGE("Inspect. Data sheet created", TRUE);
            IF NOT InspectLots.FINDFIRST THEN BEGIN
                InspectLots.SETRANGE("Inspect. Data sheet created");
                IF InspectLots.FINDSET THEN
                    REPEAT
                        PostInspLot.RUN(InspectLots);
                    UNTIL InspectLots.NEXT = 0;
            END ELSE
                ERROR(Text000);
        END;
    end;


    procedure QcOverRide();
    begin
        IF NOT Rec."QC Enabled" THEN BEGIN
            "Quantity AcceptedEditable" := TRUE;
            "Quantity RejectedEditable" := TRUE;
            "Quantity ReworkEditable" := TRUE
        END ELSE
            MESSAGE('Quantity Accepted/Rejected can''t be override when QC is enabled');
    end;


    procedure QcOverRideDisabled();
    begin
        "Quantity AcceptedEditable" := FALSE;
        "Quantity RejectedEditable" := FALSE;
        "Quantity ReworkEditable" := FALSE;
    end;


    procedure _SampleLotInspection();
    var
        SampleLotInspection: Record "Sample Lot Inspection";
    begin
        //"Sample Lot Inspection" := TRUE;
        SampleLotInspection.SETRANGE("Purchase Order No.", Rec."Order No.");
        SampleLotInspection.SETRANGE("Purchase Line No.", Rec."Order Line No.");
        PAGE.RUN(60072, SampleLotInspection);
    end;


    procedure SampleLotInspection();
    var
        SampleLotInspection: Record "Sample Lot Inspection";
    begin
        //"Sample Lot Inspection" := TRUE;
        SampleLotInspection.SETRANGE("Purchase Order No.", Rec."Order No.");
        SampleLotInspection.SETRANGE("Purchase Line No.", Rec."Order Line No.");
        PAGE.RUN(60072, SampleLotInspection);
    end;

}

