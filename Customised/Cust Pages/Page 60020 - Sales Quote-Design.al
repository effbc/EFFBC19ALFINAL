page 60020 "Sales Quote-Design"
{
    // version B2B1.0,Rev01

    Caption = 'Sales Quote';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER(Quote));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("No."; "No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    Enabled = "Sell-to Customer No.Enable";

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No."; "Sell-to Contact No.")
                {
                }
                field("Sell-to Customer Template Code"; "Sell-to Customer Template Code")
                {
                    Enabled = SelltoCustomerTemplateCodeEnab;

                    trigger OnValidate();
                    begin
                        SelltoCustomerTemplateCodeOnAf;
                    end;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code/City';
                }
                field("Sell-to City"; "Sell-to City")
                {
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                }
                /*field("Free Supply";"Free Supply")
                {
                }*/
                field("Order Date"; "Order Date")
                {
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("Campaign No."; "Campaign No.")
                {
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                }
                field(Status; Status)
                {
                }
                /* field("LC No.";"LC No.")
                 {
                 }
                 field(Structure;Structure)
                 {
                 }*/
            }
            part(SalesLines; "Sales Quote Subform-Design")
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                Editable = false;
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Enabled = "Bill-to Customer No.Enable";

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                }
                field("Bill-to Customer Template Code"; "Bill-to Customer Template Code")
                {
                    Enabled = BilltoCustomerTemplateCodeEnab;

                    trigger OnValidate();
                    begin
                        BilltoCustomerTemplateCodeOnAf;
                    end;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code/City';
                }
                field("Bill-to City"; "Bill-to City")
                {
                }
                field("Bill-to Contact"; "Bill-to Contact")
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
                field("No. of Archived Versions"; "No. of Archived Versions")
                {

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        COMMIT;
                        SalesHeaderArchive.SETRANGE("Document Type", "Document Type"::Quote);
                        SalesHeaderArchive.SETRANGE("No.", "No.");
                        SalesHeaderArchive.SETRANGE("Doc. No. Occurrence", "Doc. No. Occurrence");
                        IF SalesHeaderArchive.GET("Document Type"::Quote, "No.", "Doc. No. Occurrence", "No. of Archived Versions") THEN;
                        PAGE.RUNMODAL(PAGE::"Sales List Archive", SalesHeaderArchive);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                Editable = false;
                field("Ship-to Code"; "Ship-to Code")
                {
                }
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
                field("Shipment Date"; "Shipment Date")
                {
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Editable = false;
                field("Currency Code"; "Currency Code")
                {

                    trigger OnAssistEdit();
                    begin
                        ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                            VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade"; "EU 3-Party Trade")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Transaction Specification"; "Transaction Specification")
                {
                }
                field("Transport Method"; "Transport Method")
                {
                }
                field("Exit Point"; "Exit Point")
                {
                }
                field("Area"; Area)
                {
                }
            }
            group(" Others")
            {
                Caption = '" Others"';
                Editable = false;
                field("Type of Enquiry"; "Type of Enquiry")
                {
                }
                field("Type of Product"; "Type of Product")
                {
                }
                field("Document Position"; "Document Position")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Release To Sales")
                {
                    Caption = 'Release To Sales';
                    Image = ReleaseDoc;

                    trigger OnAction();
                    var
                        Text01: Label 'Do You want to Send the Document to Sale?';
                    begin
                        IF NOT CONFIRM(Text01, FALSE) THEN
                            EXIT;
                        TESTFIELD("Document Position", "Document Position"::Design);
                        "Document Position" := "Document Position"::Sales;
                        MODIFY;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ActivateFields;

        ActivateFields;

        OnAfterGetCurrRecord;
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin
        "Bill-to Customer No.Enable" := TRUE;
        "Sell-to Customer No.Enable" := TRUE;
        SelltoCustomerTemplateCodeEnab := TRUE;
        BilltoCustomerTemplateCodeEnab := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        CheckCreditMaxBeforeInsert;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter();
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter() <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center", UserMgt.GetSalesFilter());
            FILTERGROUP(0);
        END;

        ActivateFields;
    end;

    var
        Text000: Label 'Unable to execute this function while in view only mode.';
        SalesSetup: Record "Sales & Receivables Setup";
        CopySalesDoc: Report 292;
        DocPrint: Codeunit 229;
        UserMgt: Codeunit 5700;
        ArchiveManagement: Codeunit 5063;
        SalesHeaderArchive: Record "Sales Header Archive";
        "--NAVIN": Integer;

        Text13000: Label 'No Setup exists for this Amount.';
        Text13001: Label 'Do you want to send the Quote for Authorization?';
        Text13002: Label 'The Quote Is Authorized, You Cannot Resend For Authorization';
        Text13003: Label 'You Cannot Resend For Authorization';
        Text13004: Label 'This Quote Has been Rejected. Please Create A New Quote.';
        MLTransactionType: Option Purchase,Sale;
        [InDataSet]
        BilltoCustomerTemplateCodeEnab: Boolean;
        [InDataSet]
        SelltoCustomerTemplateCodeEnab: Boolean;
        [InDataSet]
        "Sell-to Customer No.Enable": Boolean;
        [InDataSet]
        "Bill-to Customer No.Enable": Boolean;
        ChangeExchangeRate: Page 511;


    procedure UpdateAllowed(): Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN BEGIN
            MESSAGE(Text000);
            EXIT(FALSE);
        END ELSE
            EXIT(TRUE);
    end;


    procedure ActivateFields();
    begin
        BilltoCustomerTemplateCodeEnab := "Bill-to Customer No." = '';
        SelltoCustomerTemplateCodeEnab := "Sell-to Customer No." = '';
        "Sell-to Customer No.Enable" := "Sell-to Customer Template Code" = '';
        "Bill-to Customer No.Enable" := "Bill-to Customer Template Code" = '';
    end;


    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        ActivateFields;
        CurrPage.UPDATE;
    end;


    local procedure SelltoCustomerTemplateCodeOnAf();
    begin
        ActivateFields;
        CurrPage.UPDATE;
    end;


    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        ActivateFields;
        CurrPage.UPDATE;
    end;


    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;


    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;


    local procedure BilltoCustomerTemplateCodeOnAf();
    begin
        ActivateFields;
        CurrPage.UPDATE;
    end;


    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        ActivateFields;
    end;
}

