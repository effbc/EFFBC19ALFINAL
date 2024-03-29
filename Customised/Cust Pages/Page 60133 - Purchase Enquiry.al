page 60133 "Purchase Enquiry"
{
    // version POAU,Rev01

    Caption = 'Purchase Enquiry';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = WHERE("Document Type" = FILTER(Enquiry));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                }
                field("Buy-from Contact No."; "Buy-from Contact No.")
                {
                }
                field("Buy-from Vendor Name"; "Buy-from Vendor Name")
                {
                }
                field("Buy-from Address"; "Buy-from Address")
                {
                }
                field("Buy-from Address 2"; "Buy-from Address 2")
                {
                }
                field("Buy-from Post Code"; "Buy-from Post Code")
                {
                    Caption = 'Buy-from Post Code/City';
                }
                field("Buy-from City"; "Buy-from City")
                {
                }
                field("Buy-from Contact"; "Buy-from Contact")
                {
                }
                field(Status; Status)
                {
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                }
                field("Document Date"; "Document Date")
                {
                }
                field("ICN No."; "ICN No.")
                {
                }
            }
            part(PurchLines; "Purchase Enquiry Subform")
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Pay-to Vendor No."; "Pay-to Vendor No.")
                {

                    trigger OnValidate();
                    begin
                        PaytoVendorNoOnAfterValidate;
                    end;
                }
                field("Pay-to Contact No."; "Pay-to Contact No.")
                {
                }
                field("Pay-to Name"; "Pay-to Name")
                {
                }
                field("Pay-to Address"; "Pay-to Address")
                {
                }
                field("Pay-to Address 2"; "Pay-to Address 2")
                {
                }
                field("Pay-to Post Code"; "Pay-to Post Code")
                {
                    Caption = 'Pay-to Post Code/City';
                }
                field("Pay-to City"; "Pay-to City")
                {
                }
                field("Pay-to Contact"; "Pay-to Contact")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code/City';
                }
                field("Ship-to City"; "Ship-to City")
                {
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Enquiry")
            {
                Caption = '&Enquiry';
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        PurchSetup.GET;
                        IF PurchSetup."Calc. Inv. Discount" THEN BEGIN
                            CurrPage.PurchLines.PAGE.CalcInvDisc;
                            COMMIT;
                        END;
                        PAGE.RUNMODAL(PAGE::"Purchase Statistics", Rec);
                    end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = FIELD("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 66;
                    RunPageLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No.");
                }
            }
        }
        area(processing)
        {
            //Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                separator(Action145)
                {
                }
                action("Get St&d. Vend. Purchase Codes")
                {
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    Image = Purchase;

                    trigger OnAction();
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(Action149)
                {
                }
                action("Copy Document")
                {
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = Copy;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                    end;
                }
                action("Archi&ve Document")
                {
                    Caption = 'Archi&ve Document';
                    Image = Archive;

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                separator(Action147)
                {
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit 415;
                    ShortCutKey = 'Ctrl+F9';
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        ReleasePurchDoc.Reopen(Rec);
                    end;
                }
                separator(Action1102152003)
                {
                }
                action("Copy Indent")
                {
                    Caption = 'Copy Indent';
                    Image = Indent;

                    trigger OnAction();
                    begin
                        CopyIndent;
                    end;
                }
            }
            action("Make &Quote")
            {
                Caption = 'Make &Quote';
                Image = Quote;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    Text000: Label 'Do you want to convert the Enquiry to Quote?';
                    Text001: Label 'Enquiry %1 has been changed to Quote %2';
                    PurchaseHeader: Record "Purchase Header";
                    PurchaseLine: Record "Purchase Line";
                    PurchaseSetup: Record "Purchases & Payables Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    PurchaseLineQuote: Record "Purchase Line";
                    PurchHeader: Record "Purchase Header";
                begin
                    TESTFIELD("Buy-from Vendor No.");
                    IF NOT CONFIRM(Text000, FALSE) THEN
                        EXIT;
                    POAutomation.ConvertEnquirytoQuote(Rec);
                    /*
                    PurchaseHeader.INIT;
                    PurchaseHeader."Document Type" := PurchaseHeader."Document Type" :: Quote;
                    PurchaseSetup.GET;
                    PurchaseHeader."No." := NoSeriesMgt.GetNextNo(PurchaseSetup."Quote Nos.",WORKDATE,TRUE);
                    PurchaseHeader."Buy-from Vendor No." := "Buy-from Vendor No.";
                    PurchaseHeader."Requested Receipt Date" := "Requested Receipt Date";
                    PurchaseHeader.VALIDATE("Buy-from Vendor No.");
                    PurchaseHeader."Order Date" := WORKDATE;
                    PurchaseHeader."Due Date" := "Due Date";
                    PurchaseHeader."Document Date" := WORKDATE;
                    PurchaseHeader."Requested Receipt Date" := "Requested Receipt Date";
                    PurchaseHeader.INSERT;
                    
                    PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type" :: Enquiry);
                    PurchaseLine.SETRANGE("Document No.","No.");
                    IF PurchaseLine.FINDSET THEN
                      REPEAT
                        PurchaseLineQuote.INIT;
                        PurchaseLineQuote."Document Type" := PurchaseLineQuote."Document Type" :: Quote;
                        PurchaseLineQuote."Document No." := PurchaseHeader."No.";
                        PurchaseLineQuote."Buy-from Vendor No." := "Buy-from Vendor No.";
                        PurchaseLineQuote."Line No." := PurchaseLineQuote."Line No." + 10000;
                        IF PurchaseLine.Type = PurchaseLine.Type :: Item THEN BEGIN
                          PurchaseLineQuote.Type := PurchaseLineQuote.Type :: Item;
                          PurchaseLineQuote."No." := PurchaseLine."No.";
                          PurchaseLineQuote.Quantity := PurchaseLine.Quantity;
                          PurchaseLineQuote."Location Code" := PurchaseLine."Location Code";
                          PurchaseLineQuote.VALIDATE("No.");
                          PurchaseLineQuote.VALIDATE(Quantity);
                          PurchaseLineQuote.VALIDATE("Location Code");
                        END ELSE BEGIN
                          PurchaseLineQuote.Type := PurchaseLineQuote.Type ::" ";
                          PurchaseLineQuote.Description := PurchaseLine.Description;
                        END;
                        PurchaseLineQuote.INSERT;
                      UNTIL PurchaseLine.NEXT = 0;
                    MESSAGE(Text001,"No.",PurchaseLineQuote."Document No.");
                    DELETE;
                    */

                end;
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    //DocPrint.PrintPurchHeader(Rec);
                    PurchHeader.SETRANGE("Document Type", "Document Type");
                    PurchHeader.SETRANGE("No.", "No.");
                    REPORT.RUN(50022, TRUE, FALSE, PurchHeader);
                end;
            }
        }
    }

    var
        PurchSetup: Record "Purchases & Payables Setup";
        CopyPurchDoc: Report "Copy Purchase Document";
        DocPrint: Codeunit 229;
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        "-- NAVIN": Integer;
        Text13000: Label 'No Setup exists for this Amount.';
        Text13001: Label 'Do you want to send the quote for Authorization?';
        Text13002: Label 'The Quote Is Authorized, You Cannot Resend For Authorization';
        Text13003: Label 'You Cannot Resend For Authorization';
        Text13004: Label 'This Quote Has been Rejected. Please Create A New Quote.';
        MLTransactionType: Option Purchase,Sale;
        ReportSelection: Record "Report Selections";
        PurchHeader: Record "Purchase Header";
        POAutomation: Codeunit "PO Automation";


    local procedure PaytoVendorNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;


    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;


    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;
}

