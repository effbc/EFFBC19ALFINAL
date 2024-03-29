page 60244 "Effe Hyd Sale Orders List"
{
    // version Rev01

    Caption = 'Effe Hyd Sale Orders List';
    CardPageID = "Effe Hyd Sale Orders";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER(Order), "Order Status" = FILTER(<> "Temporary Close"), "No." = FILTER('EFF/SAL')); ///T*));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                }
                field(forwordoms; forwordtooms)
                {
                    Style = Standard;
                    StyleExpr = TRUE;
                    Visible = forwordomsVisible;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Sell-to Contact No."; "Sell-to Contact No.")
                {
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    Editable = true;
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    Editable = true;
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    Editable = true;
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code/City';
                    Editable = true;
                }
                field("Sell-to City"; "Sell-to City")
                {
                    Editable = true;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {
                }
                /*field(Structure; Structure)
                {
                }*/
                field("Installation Amount"; "Installation Amount")
                {
                    Editable = false;
                }
                field("Bought out Items Amount"; "Bought out Items Amount")
                {
                    Editable = false;
                }
                field(Product; Product)
                {
                }
                field("Software Amount"; "Software Amount")
                {
                    Editable = false;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
                field(Comment; Comment)
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Order Date"; "Order Date")
                {
                    Editable = false;
                    Enabled = true;
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                }
                field("Project Completion Date"; "Project Completion Date")
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Editable = true;
                }
                field("Campaign No."; "Campaign No.")
                {
                }
                field("Opportunity No."; "Opportunity No.")
                {
                }
                field("Order Released Date"; "Order Released Date")
                {
                    Editable = false;
                }
                field("External Document No."; "External Document No.")
                {
                }
                field("Total Order(LOA)Value"; "Total Order(LOA)Value")
                {
                    Editable = false;
                }
                field("Pending(LOA)Value"; "Pending(LOA)Value")
                {
                    Editable = false;
                }
                field("Sale Order Total Amount"; "Sale Order Total Amount")
                {
                    Editable = true;
                }
                field("Customer OrderNo."; "Customer OrderNo.")
                {
                }
                field("Customer Order Date"; "Customer Order Date")
                {
                }
                field("Quote No."; "Quote No.")
                {
                }
                field(Status; Status)
                {
                    Editable = false;
                }
                field(Order_After_CF_Integration; Order_After_CF_Integration)
                {
                }
            }
            group(Control1102152003)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152002)
                {
                    ShowCaption = false;
                    group(Control1102152001)
                    {
                        ShowCaption = false;
                        field("TotalOrders+FORMAT(Rec.COUNT)"; TotalOrders + FORMAT(Rec.COUNT))
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F9';
                    trigger OnAction();

                    var
                        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
                    begin
                        /*
                        SalesSetup.GET;
                        CALCFIELDS("Price Inclusive of Taxes");
                        IF SalesSetup."Calc. Inv. Discount" AND (NOT "Price Inclusive of Taxes") THEN BEGIN
                            CalcInvDiscForHeader;
                            COMMIT
                        END;
                        IF "Price Inclusive of Taxes" THEN BEGIN
                            SalesLine.InitStrOrdDetail(Rec);
                            SalesLine.GetSalesPriceExclusiveTaxes(Rec);
                            SalesLine.UpdateSalesLinesPIT(Rec);
                            COMMIT;
                        END;

                        IF Rec.Structure <> '' THEN BEGIN
                            SalesLine.CalculateStructures(Rec);
                            SalesLine.AdjustStructureAmounts(Rec);
                            SalesLine.UpdateSalesLines(Rec);
                            SalesLine.CalculateTCS(Rec);
                        END ELSE BEGIN
                            SalesLine.CalculateTCS(Rec);
                        END;

                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Sales Order Statistics", Rec);
                        */


                        OpenSalesOrderStatistics;
                        SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);


                    end;

                    /* trigger OnAction();
                     begin
                         SalesSetup.GET;
                         // CALCFIELDS("Price Inclusive of Taxes");
                         IF SalesSetup."Calc. Inv. Discount" AND (NOT "Price Inclusive of Taxes") THEN BEGIN
                             CalcInvDiscForHeader;
                             COMMIT
                         END;
                         /* IF "Price Inclusive of Taxes" THEN BEGIN
                              SalesLine.InitStrOrdDetail(Rec);
                              SalesLine.GetSalesPriceExclusiveTaxes(Rec);
                              SalesLine.UpdateSalesLinesPIT(Rec);
                              COMMIT;
                          END;*/

                    /* IF Rec.Structure <> '' THEN BEGIN
                         SalesLine.CalculateStructures(Rec);
                         SalesLine.AdjustStructureAmounts(Rec);
                         SalesLine.UpdateSalesLines(Rec);
                         SalesLine.CalculateTCS(Rec);
                     END ELSE BEGIN
                         SalesLine.CalculateTCS(Rec);
                     END;*/ //B2BUPG

                    //COMMIT;
                    //PAGE.RUNMODAL(PAGE::"Sales Order Statistics", Rec);
                    // end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page "Customer Card";
                    RunPageLink = "No." = FIELD("Sell-to Customer No.");
                    ShortCutKey = 'Shift+F5';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 67;
                    RunPageLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No."), "Document Line No." = CONST(0);
                }
                action("S&hipments")
                {
                    Caption = 'S&hipments';
                    Image = Shipment;
                    RunObject = Page 142;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    Image = Invoice;
                    RunObject = Page 143;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action("Prepa&yment Invoices")
                {
                    Caption = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page 143;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
                action("Prepayment Credi&t Memos")
                {
                    Caption = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 144;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
                action("Test Report")
                {
                    Caption = 'Test Report';

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnInit();
    begin
        SalesHistoryStnVisible := TRUE;
        BillToCommentBtnVisible := TRUE;
        BillToCommentPictVisible := TRUE;
        SalesHistoryBtnVisible := TRUE;
        "Order AssuranceEditable" := TRUE;
        forwordomsVisible := TRUE;
        ReturnOrderNoVisible := TRUE;
    end;

    trigger OnOpenPage();
    begin

        IF UserMgt.GetSalesFilter() <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center", UserMgt.GetSalesFilter());
            FILTERGROUP(0);
        END;
        "sales header".SETRANGE("sales header"."No.", "No.");
        IF "sales header".FINDFIRST THEN BEGIN
            IF "sales header"."Order Assurance" = FALSE THEN
                "Order AssuranceEditable" := TRUE
            ELSE
                "Order AssuranceEditable" := FALSE;

            /*IF "sales header"."Sale Order Total Amount">0 THEN
            CurrPage."Sale Order Total Amount".EDITABLE:=FALSE
            ELSE
            CurrPage."Sale Order Total Amount".EDITABLE:=TRUE;

            IF "sales header"."Salesperson Code"='' THEN
            CurrPage."Salesperson Code".EDITABLE:=TRUE
            ELSE
            CurrPage."Salesperson Code".EDITABLE:=FALSE;
            IF "sales header"."Exp.Payment">0 THEN
            CurrPage."Exp.Payment".EDITABLE:=FALSE
            ELSE
            CurrPage."Exp.Payment".EDITABLE:=TRUE;

            IF "sales header"."Security Deposit Amount">0 THEN
            CurrPage."Security Deposit Amount".EDITABLE:=FALSE
            ELSE
            CurrPage."Security Deposit Amount".EDITABLE:=TRUE;*/
        END;

        "sales header".RESET;
        "sales header".SETFILTER("sales header"."External Document No.", '<>%1', ' ');
        IF "sales header".FINDSET THEN
            REPEAT
                "sales header"."External Document No." := '';
                "sales header".MODIFY;
            UNTIL "sales header".NEXT = 0;

        SETRANGE("Date Filter", 0D, WORKDATE - 1);
        forwordtooms := 'Need To Press FORWARD OMS Button';
        /*  IF "Installa Amount">0 THEN
          CurrPage."Installation Amount(CS)".EDITABLE(FALSE)
          ELSE
          CurrPage."Installation Amount(CS)".EDITABLE(TRUE);
         */

    end;

    var
        From: Date;
        To: Date;
        Text000: Label 'Unable to execute this function while in view only mode.';
        CopySalesDoc: Report 292;
        MoveNegSalesLines: Report "Move Negative Sales Lines";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        ArchiveManagement: Codeunit ArchiveManagement;
        // SalesInfoPaneMgt: Codeunit "Sales Info-Pane Management";
        SalesSetup: Record "Sales & Receivables Setup";
        UserMgt: Codeunit "User Setup Management";
        Usage: Option "Order Confirmation","Work Order";
        Text001: Label 'There are non posted Prepayment Amounts on %1 %2.';
        Text002: Label 'There are unpaid Prepayment Invoices related to %1 %2.';
        SalesLine: Record "Sales Line";
        Text16500: Label 'You can not uncheck Re-Dispatch until Return Receipt No. is Blank.';
        Text16501: TextConst ENU = 'To calculate invoice discount, check Cal. Inv. Discount on header when Price Inclusive of Tax = Yes.\This option cannot be used to calculate invoice discount when Price Inclusive Tax = Yes.';
        MLTransactionType: Option Purchase,Sale;
        SalesPlanLine: Record "Sales Planning Line";
        Quantity: Decimal;
        SalesLineRec: Record "Sales Line";
        I: Integer;
        Qty: Decimal;
        NewStatus: Option Simulated,Planned,"Firm Planned",Released;
        NewOrderType: Option ItemOrder,ProjectOrder;
        eroorno: Integer;
        user: Record User;
        "Mail-Id": Record User;
        "from Mail": Text[1000];
        "to mail": Text[1000];
        Mail_Subject: Text[1000];
        Mail_Body: Text[1000];
        mail: Codeunit Mail;
        amt: Decimal;
        vatamt: Decimal;
        taxamt: Decimal;
        exciseamt: Decimal;
        pendingamt: Decimal;
        ecessamt: Decimal;
        shecessamt: Decimal;
        "sales header": Record "Sales Header";
        newline: Char;
        SHA: Record "Sales Header Archive";
        CUS: Record Customer;
        CLE: Record "Cust. Ledger Entry";
        Receivedamt: Decimal;
        Needtoreceive: Decimal;
        PT: Record "Payment Terms";
        Percent: Decimal;
        Actualreceived: Decimal;
        CI: Boolean;
        NI: Boolean;
        POSTEDINVOICE: Record "Sales Invoice Header";
        X: Text[30];
        y: Code[10];
        SI: Boolean;
        NORMAL: Boolean;
        salhed: Record "Sales Header";
        SL: Record "Sales Line";
        j: Integer;
        SMTPSETUP: Record "SMTP SETUP";
        AttachFileName: Text[1000];
        /*  objEmailConf: Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000002-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Configuration";
         objEmail: Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000001-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Message";
         flds: Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000564-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Fields";
         fld: Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000569-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Field"; */
        bodies: Integer;
        body1: Text[1000];
        Body: Text[1000];
        Subject: Text[1000];
        Mail_To: Text[1000];
        Mail_From: Text[1000];
        Attachment: Text[1000];
        nextline: Char;
        paymenttermdesc: Text[100];
        SALPUR: Record "Salesperson/Purchaser";
        spname: Text[20];
        Cust: Record Customer;
        cusbalance: Text[20];
        SQLQuery: Text[1000];
        ConnectionOpen: Integer;
        RowCount: Integer;
        updateQuery: Text[500];
        servicetaxamt: Decimal;
        temp: Integer;
        user1: Record User;
        username: Text[30];
        //SMTP_MAIL: Codeunit "SMTP Mail";
        InvoiceNos: Option " ",ExciseInv,ServiceInv,TradingInv,InstInv;
        SCHEDULEOMS: Record Schedule2;
        salesheader: Record "Sales Header";
        Attachment1: Text[1000];
        forwordtooms: Text[50];
        CHANGELOGSETUP: Record "Change Log Entry";
        SIH: Record "Sales Invoice Header";
        NoSeriesMgt: Codeunit 396;

        ReturnOrderNoVisible: Boolean;

        forwordomsVisible: Boolean;

        "Order AssuranceEditable": Boolean;

        "No.Emphasize": Boolean;

        SalesHistoryBtnVisible: Boolean;

        BillToCommentPictVisible: Boolean;

        BillToCommentBtnVisible: Boolean;

        SalesHistoryStnVisible: Boolean;
        Text19070588: Label 'Sell-to Customer';
        Text19069283: Label 'Bill-to Customer';
        ChangeExchangeRate: Page 511;
        "--Rev01": Integer;
        /*  SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
         RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset"; */
        TotalOrders: Label '"Total Orders: "';


    procedure UpdateAllowed(): Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
            ERROR(Text000);
        EXIT(TRUE);
    end;

    /*
        local procedure UpdateInfoPanel();
        var
            DifferSellToBillTo: Boolean;
        begin
            DifferSellToBillTo := "Sell-to Customer No." <> "Bill-to Customer No.";
            SalesHistoryBtnVisible := DifferSellToBillTo;
            BillToCommentPictVisible := DifferSellToBillTo;
            BillToCommentBtnVisible := DifferSellToBillTo;
            SalesHistoryStnVisible := SalesInfoPaneMgt.DocExist(Rec, "Sell-to Customer No.");
            IF DifferSellToBillTo THEN
                SalesHistoryBtnVisible := SalesInfoPaneMgt.DocExist(Rec, "Bill-to Customer No.")
        end;

    */
    procedure "---B2B---"();
    begin
    end;


    procedure DocumentPosition();
    begin
        /*
        IF "Document Position" = "Document Position" :: Design THEN
          CurrPage.EDITABLE := FALSE
        ELSE
          CurrPage.EDITABLE := TRUE;
        */

    end;


    procedure CreateOrders(Qtyparam: Decimal) OrdersCreated: Boolean;
    var
        Item: Record Item;
        SalesLine: Record "Sales Line";
        ProdOrderFromSale: Codeunit "Event Handling Cust";
    begin
        IF NOT SalesPlanLine.FINDSET THEN
            EXIT;

        REPEAT
            SalesLine.GET(
              SalesLine."Document Type"::Order,
              SalesPlanLine."Sales Order No.",
              SalesPlanLine."Sales Order Line No.");
            //SalesLine.TESTFIELD("Shipment Date");
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(SalesLine."No.");
            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
                OrdersCreated := TRUE;
                ProdOrderFromSale.CreateProdOrder2(SalesLine, NewStatus::Released, NewOrderType::ItemOrder, 1);
                IF NewOrderType = NewOrderType::ProjectOrder THEN
                    EXIT;
            END;
        //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;


    procedure calcamt();
    begin
        "Sale Order Total Amount" := 0;
        SalesLine.SETRANGE(SalesLine."Document No.", "No.");
        IF SalesLine.FINDSET THEN
            REPEAT
                "Sale Order Total Amount" += SalesLine."Line Amount";//+ SalesLine."Excise Amount" + SalesLine."Tax Amount";
            UNTIL SalesLine.NEXT = 0;
        MODIFY;
    end;


    procedure ChooseInvoice();
    var
        temp: Integer;
    begin
        temp := 0;
        "sales header".RESET;
        "sales header".SETFILTER("sales header"."External Document No.", '<>%1', ' ');
        IF "sales header".FINDSET THEN
            REPEAT
                "sales header"."External Document No." := '';
                "sales header".MODIFY;
            UNTIL "sales header".NEXT = 0;

        CASE InvoiceNos OF
            1:
                BEGIN

                    salhed.SETFILTER(salhed."Document Type", 'Order');
                    salhed.SETFILTER(salhed."External Document No.", '<>%1', '');
                    IF salhed.COUNT > 0 THEN
                        IF salhed.FINDSET THEN
                            REPEAT
                                ERROR(salhed."No." + '  Sale Have the Invoice Number');
                            UNTIL salhed.NEXT = 0;

                    //ERROR('Invoice Number Already Assign to Another Sale Order');
                    //POSTEDINVOICE.RESET;
                    /*  POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
                      POSTEDINVOICE.ASCENDING;      //this line too
                      POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(010412D),(310313D));
                      POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'L00000..L99999');
                    //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
                      IF POSTEDINVOICE.FINDLAST THEN
                      BEGIN
                      y:='0';
                      y:=POSTEDINVOICE."External Document No.";
                      temp:=1;
                      END;
                      IF temp=0 THEN
                        "External Document No.":='L00001'
                      ELSE
                      "External Document No.":=INCSTR(y);*/

                    POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
                    POSTEDINVOICE.ASCENDING;      //this line too
                    POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date", (DMY2Date(04, 01, 13)), (DMY2Date(03, 31, 14)));
                    POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.", '0..999');
                    //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
                    IF POSTEDINVOICE.FINDLAST THEN BEGIN
                        y := '0';
                        y := POSTEDINVOICE."External Document No.";
                        temp := 1;
                    END;
                    IF temp = 0 THEN
                        "External Document No." := '001'
                    ELSE
                        "External Document No." := INCSTR(y);

                    //  UNTIL POSTEDINVOICE.NEXT = 0;
                    //  "External Document No.":=INCSTR(y);
                    //MESSAGE(FORMAT("External Document No."));
                    MODIFY;
                END;

            2:
                BEGIN
                    salhed.SETFILTER(salhed."Document Type", 'Order');
                    salhed.SETFILTER(salhed."External Document No.", '<>%1', '');
                    IF salhed.COUNT > 0 THEN
                        IF salhed.FINDSET THEN
                            REPEAT
                                ERROR(salhed."No." + '  Sale Have the Invoice Number');
                            UNTIL salhed.NEXT = 0;

                    //ERROR('Invoice Number Already Assign to Another Sale Order');
                    POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
                    POSTEDINVOICE.ASCENDING;      //this line too
                    POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date", (DMY2Date(04, 01, 13)), (DMY2Date(03, 31, 14)));
                    POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.", 'SI*');
                    //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
                    IF POSTEDINVOICE.FINDLAST THEN BEGIN
                        y := '0';
                        y := POSTEDINVOICE."External Document No.";
                        temp := 1;
                    END;
                    IF temp = 0 THEN
                        "External Document No." := 'SI-001'
                    ELSE
                        "External Document No." := INCSTR(y);

                    /* IF POSTEDINVOICE.FINDLAST THEN
                     REPEAT
                     y:=POSTEDINVOICE."External Document No.";
                     UNTIL POSTEDINVOICE.NEXT = 0;
                     "External Document No.":=INCSTR(y);*/
                    //MESSAGE(FORMAT("External Document No."));
                    MODIFY;

                END;
            3:
                BEGIN
                    salhed.SETFILTER(salhed."Document Type", 'Order');
                    salhed.SETFILTER(salhed."External Document No.", '<>%1', '');
                    IF salhed.COUNT > 0 THEN
                        IF salhed.FINDSET THEN
                            REPEAT
                                ERROR(salhed."No." + '  Sale Have the Invoice Number');
                            UNTIL salhed.NEXT = 0;

                    //ERROR('Invoice Number Already Assign to Another Sale Order');
                    POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
                    POSTEDINVOICE.ASCENDING;      //this line too
                    POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date", (DMY2Date(04, 01, 13)), (DMY2Date(03, 31, 14)));
                    POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.", 'CI*');
                    //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
                    IF POSTEDINVOICE.FINDLAST THEN BEGIN
                        y := '0';
                        y := POSTEDINVOICE."External Document No.";
                        temp := 1;
                    END;
                    IF temp = 0 THEN
                        "External Document No." := 'CI-001'
                    ELSE
                        "External Document No." := INCSTR(y);

                    /*IF POSTEDINVOICE.FINDLAST THEN
                    REPEAT
                    y:=POSTEDINVOICE."External Document No.";
                    UNTIL POSTEDINVOICE.NEXT = 0;
                    "External Document No.":=INCSTR(y);*/
                    //MESSAGE(FORMAT("External Document No."));
                    MODIFY;

                END;
            4:
                BEGIN
                    salhed.SETFILTER(salhed."Document Type", 'Order');
                    salhed.SETFILTER(salhed."External Document No.", '<>%1', '');
                    IF salhed.COUNT > 0 THEN
                        IF salhed.FINDSET THEN
                            REPEAT
                                ERROR(salhed."No." + '  Sale Have the Invoice Number');
                            UNTIL salhed.NEXT = 0;

                    //ERROR('Invoice Number Already Assign to Another Sale Order');
                    POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
                    POSTEDINVOICE.ASCENDING;      //this line too
                    POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date", (DMY2Date(04, 01, 13)), (DMY2Date(03, 31, 14)));
                    POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.", 'IN*');
                    //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
                    IF POSTEDINVOICE.FINDLAST THEN BEGIN
                        y := '0';
                        y := POSTEDINVOICE."External Document No.";
                        temp := 1;
                    END;
                    IF temp = 0 THEN
                        "External Document No." := 'IN-001'
                    ELSE
                        "External Document No." := INCSTR(y);

                    /*IF POSTEDINVOICE.FINDLAST THEN
                    REPEAT
                    y:=POSTEDINVOICE."External Document No.";
                    UNTIL POSTEDINVOICE.NEXT = 0;
                    "External Document No.":=INCSTR(y);*/
                    //MESSAGE(FORMAT("External Document No."));
                    MODIFY;

                END;

        END;

    end;


}

