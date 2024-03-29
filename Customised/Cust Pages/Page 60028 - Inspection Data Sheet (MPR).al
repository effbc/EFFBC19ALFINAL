page 60028 "Inspection Data Sheet (MPR)"
{
    // version QC1.1,Cal1.0,RQC1.0,Rev01

    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Inspection Datasheet Header";
    SourceTableView = WHERE("QAS/MPR" = FILTER(MPR));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Item No."; "Item No.")
                {
                    Editable = false;
                }
                field("Item Description"; "Item Description")
                {
                    Editable = false;
                }
                field(Quantity; Quantity)
                {
                    DecimalPlaces = 0 : 0;
                    Editable = false;
                }
                field("Unit Of Measure Code"; "Unit Of Measure Code")
                {
                    Editable = false;
                }
                field("Spec ID"; "Spec ID")
                {
                    Editable = false;
                }
                field(Make; Make)
                {
                    Editable = false;
                }
                field("Lot No."; "Lot No.")
                {
                    Editable = false;
                }
                field(Location; Location)
                {
                    Editable = false;
                }
                field("Inspection Group Code"; "Inspection Group Code")
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    Editable = false;
                }
                field("Inspection Receipt No."; "Inspection Receipt No.")
                {
                    Editable = false;
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                    Editable = false;
                }
                field("Source Type"; "Source Type")
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                    Editable = false;
                }
                field("Actual Time"; "Actual Time")
                {
                    Caption = 'Bench Mark Time';
                    Editable = false;
                }
                field("Time Taken"; "Time Taken")
                {
                    Editable = false;
                }
                field("Creation DateTime"; "Creation DateTime")
                {
                }
            }
            part(subform; "Inspection Data Sheet Subform")
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Receipt)
            {
                Caption = 'Receipt';
                field("Vendor No."; "Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    Editable = false;
                }
                field("Vendor Name 2"; "Vendor Name 2")
                {
                    Editable = false;
                }
                field("Vendor Address"; "Vendor Address")
                {
                    Editable = false;
                }
                field("Vendot Address 2"; "Vendot Address 2")
                {
                    Editable = false;
                }
                field("Contact Person"; "Contact Person")
                {
                    Editable = false;
                }
                field("Receipt No."; "Receipt No.")
                {
                    Editable = false;
                }
                field("Order No."; "Order No.")
                {
                    Editable = false;
                }
                field("Purch Line No"; "Purch Line No")
                {
                    Editable = false;
                }
                field("Purchase Consignment No."; "Purchase Consignment No.")
                {
                    Editable = false;
                }
                field("External Document No."; "External Document No.")
                {
                    Editable = false;
                }
                field("Item Tracking Exists"; "Item Tracking Exists")
                {
                    Editable = false;
                }
                field("Quality Before Receipt"; "Quality Before Receipt")
                {
                    Editable = false;
                }
            }
            group(Production)
            {
                Caption = 'Production';
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                }
                field("Prod. Order Line"; "Prod. Order Line")
                {
                    Editable = false;
                }
                field("Prod. Description"; "Prod. Description")
                {
                    Editable = false;
                }
                field("Production Batch No."; "Production Batch No.")
                {
                    Editable = false;
                }
                field("Routing No."; "Routing No.")
                {
                    Editable = false;
                }
                field("Routing Reference No."; "Routing Reference No.")
                {
                    Editable = false;
                }
                field("Operation Description"; "Operation Description")
                {
                    Editable = false;
                }
                field("Reason for Pending"; "Reason for Pending")
                {
                }
                field("Sub Assembly Code"; "Sub Assembly Code")
                {
                    Editable = false;
                }
                field("Sub Assembly Description"; "Sub Assembly Description")
                {
                    Editable = false;
                }
                field("In Process"; "In Process")
                {
                    Editable = false;
                }
                field(Resource; Resource)
                {
                    Editable = false;
                }
                field("OutPut Jr Serial No."; "OutPut Jr Serial No.")
                {
                    Editable = false;
                }
                field("Finished Product Sr No"; "Finished Product Sr No")
                {
                    Editable = false;
                }
                field("Rework User"; "Rework User")
                {
                    Editable = false;
                }
                field("<Finished Product Sr No2>"; "Finished Product Sr No")
                {
                }
            }
            group("Sales Returns")
            {
                Caption = 'Sales Returns';
                field("Sales Order No."; "Sales Order No.")
                {
                }
                field("Posted Sales Order No."; "Posted Sales Order No.")
                {
                }
                field("Sales Line No"; "Sales Line No")
                {
                }
                field("Customer No."; "Customer No.")
                {
                }
                field("Customer Name"; "Customer Name")
                {
                }
                field("Customer Name 2"; "Customer Name 2")
                {
                }
                field("Customer Address"; "Customer Address")
                {
                }
                field("Customer Address2"; "Customer Address2")
                {
                }
            }
            group(Transfer)
            {
                Caption = 'Transfer';
                field("Trans. Order No."; "Trans. Order No.")
                {
                    Editable = false;
                }
                field("Trans. Order Line"; "Trans. Order Line")
                {
                    Editable = false;
                }
                field("Trans. Description"; "Trans. Description")
                {
                    Editable = false;
                }
                field("Transfer-from Code"; "Transfer-from Code")
                {
                    Editable = false;
                }
                field("Transfer-to Code"; "Transfer-to Code")
                {
                    Editable = false;
                }
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field("<Vendor No.2>"; "Vendor No.")
                {
                    Editable = false;
                }
                field("<Vendor Name2>"; "Vendor Name")
                {
                    Editable = false;
                }
                field("<Vendor Address2>"; "Vendor Address")
                {
                    Editable = false;
                }
                field("<Vendot Address 22>"; "Vendot Address 2")
                {
                    Editable = false;
                }
                field("<Contact Person2>"; "Contact Person")
                {
                    Editable = false;
                }
                field("Calibration Party"; "Calibration Party")
                {
                    Editable = false;
                }
                field("<Resource2>"; Resource)
                {
                    Editable = false;
                }
                field("Eqpt. Serial No."; "Eqpt. Serial No.")
                {
                    Editable = false;
                }
                field("Least Count"; "Least Count")
                {
                    Editable = false;
                }
                field(Department; Department)
                {
                    Editable = false;
                }
                field("Std. Reference"; "Std. Reference")
                {
                    Editable = false;
                }
                field("Measuring Range"; "Measuring Range")
                {
                    Editable = false;
                }
                field("Model No."; "Model No.")
                {
                    Editable = false;
                }
            }
            group(Others)
            {
                Caption = 'Others';
                field("Item Category Code"; "Item Category Code")
                {
                }
                field("Product Group Code"; "Product Group Code")
                {
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
                {
                }
                field("No. of Opportunities"; "No. of Opportunities")
                {
                }
                field("No.of Fixing Holes"; "No.of Fixing Holes")
                {
                }
                field("No. of Soldering Points"; "No. of Soldering Points")
                {
                }
                field("No. of Pins"; "No. of Pins")
                {
                }
                field("Parent IDS No"; "Parent IDS No")
                {
                }
                field("Partial Inspection"; "Partial Inspection")
                {
                    Editable = false;
                }
                field("Qty in IDS"; "Qty in IDS")
                {
                    Editable = "Qty in IDSEditable";
                }
                field("Total Qty in IDS"; "Total Qty in IDS")
                {
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    Editable = false;
                }
                field("Reclass Entry"; "Reclass Entry")
                {
                }
                field("Total Qty in IR"; "Total Qty in IR")
                {
                    Editable = false;
                }
                field("Total Qty in PIR"; "Total Qty in PIR")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Data Sheet")
            {
                Caption = '&Data Sheet';
                separator(Action1000000049)
                {
                }
                action("Purch. Receipt")
                {
                    Caption = 'Purch. Receipt';
                    Image = PostedReceipt;
                    RunObject = Page "Posted Purchase Receipt";
                    RunPageLink = "No." = FIELD("Receipt No.");
                }
                action("Calibration  &Procedure")
                {
                    Caption = 'Calibration  &Procedure';
                    Image = CheckList;

                    trigger OnAction();
                    begin
                        CalProHeader.ShowCalProcForIDs(Rec);
                    end;
                }
                action(Specifications)
                {
                    Caption = 'Specifications';
                    Image = CodesList;
                    RunObject = Page "Sales Amc Subform1";
                    RunPageLink = "No." = FIELD("Item No.");
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                action(Defects)
                {
                    Caption = 'Defects';
                    Image = ErrorFALedgerEntries;

                    trigger OnAction();
                    begin
                        CurrPage.subform.PAGE.ShowDefects;
                    end;
                }
                action("Item &Tracking")
                {
                    Caption = 'Item &Tracking';
                    Image = ItemTracking;

                    trigger OnAction();
                    begin
                        IF "Parent IDS No" = '' THEN BEGIN
                            QualityILE.RESET;
                            QualityILE.SETRANGE("Document No.", "Receipt No.");
                            QualityILE.SETRANGE("Item No.", "Item No.");
                            QualityILE.SETRANGE(QualityILE."Purch.Rcpt Line", "Purch Line No");
                            QualityILE.SETRANGE(QualityILE."Child Ids", '');
                            QualityILE.SETRANGE(QualityILE.Select, FALSE);
                            QualityILE.SETRANGE(QualityILE."Lot No.", "Lot No.");
                            PAGE.RUN(PAGE::"Quality Item Ledger Entries", QualityILE)
                        END ELSE BEGIN
                            QualityILE.RESET;
                            QualityILE.SETRANGE("Document No.", "Receipt No.");
                            QualityILE.SETRANGE("Item No.", "Item No.");
                            QualityILE.SETRANGE(QualityILE."Purch.Rcpt Line", "Purch Line No");
                            QualityILE.SETRANGE(QualityILE.Select, TRUE);
                            QualityILE.SETRANGE(QualityILE."Child Ids", "No.");
                            QualityILE.SETRANGE(QualityILE."Lot No.", "Lot No.");
                            PAGE.RUN(PAGE::"Partial  IDS QLE", QualityILE);
                        END;
                    end;
                }
                action(Accept)
                {
                    Caption = 'Accept';
                    Image = Approval;

                    trigger OnAction();
                    begin
                        DataSheetLine.SETFILTER(DataSheetLine."Document No.", "No.");
                        DataSheetLine.SETFILTER(DataSheetLine."Character Code", '<>'' ''');
                        IF DataSheetLine.FINDSET THEN
                            REPEAT
                                DataSheetLine.Accept := TRUE;
                                DataSheetLine.MODIFY;
                            UNTIL DataSheetLine.NEXT = 0;
                        MESSAGE(FORMAT(DataSheetLine.COUNT));
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction();
                    var
                        "Count": Integer;
                    begin
                        Count := 0;
                        DataSheetLine.SETRANGE("Document No.", "No.");
                        IF DataSheetLine.FINDSET THEN
                            REPEAT
                                check := FALSE;
                                IF (DataSheetLine."Normal Value (Text)" <> '') OR (DataSheetLine."Min. Value (Text)" <> '')
                                  OR (DataSheetLine."Max. Value (Text)" <> '') THEN
                                    IF DataSheetLine."Actual  Value (Text)" = '' THEN BEGIN
                                        Count := Count + 1;
                                        check := TRUE;
                                    END;
                                IF (check = FALSE) AND ((DataSheetLine."Normal Value (Num)" <> 0) OR (DataSheetLine."Min. Value (Num)" <> 0)
                                  OR (DataSheetLine."Max. Value (Num)" <> 0)) THEN
                                    IF DataSheetLine."Actual Value (Num)" = 0 THEN
                                        Count := Count + 1;
                            UNTIL DataSheetLine.NEXT = 0;


                        IF Count = 0 THEN BEGIN
                            IF CONFIRM(TEXT001, FALSE, Count) THEN
                                Status := Status::Released;
                        END ELSE
                            IF CONFIRM(TEXT000, FALSE, Count) THEN
                                Status := Status::Released;
                        CurrPage.UPDATE;
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        Status := Status::Open;
                        CurrPage.UPDATE;
                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;

                    trigger OnAction();
                    begin

                        attachment.RESET;
                        attachment.SETRANGE("Table ID", DATABASE::"Inspection Datasheet Header");
                        //attachment.SETRANGE(attachment."Ids Reference No.",);
                        attachment.SETRANGE("Document No.", "No.");
                        PAGE.RUN(PAGE::"ESPL Attachments", attachment);
                    end;
                }
                separator(Action1102154004)
                {
                }
                action("Select Ids Qty")
                {
                    Caption = 'Select Ids Qty';
                    Image = SerialNoProperties;

                    trigger OnAction();
                    begin

                        IDS_Qty := 0;
                        QualityILE.RESET;
                        QualityILE.SETRANGE("Document No.", "Receipt No.");
                        QualityILE.SETRANGE("Item No.", "Item No.");
                        QualityILE.SETRANGE(Select, FALSE);
                        REPEAT
                            QualityILE.Select := TRUE;
                            QualityILE.MODIFY;
                            IDS_Qty += 1;
                            QualityILE.NEXT;
                            MESSAGE(QualityILE."Serial No.");

                        UNTIL IDS_Qty < "Qty in IDS";
                        MESSAGE(FORMAT(IDS_Qty) + ' items are selected');
                    end;
                }
                action("Create &Relcassification")
                {
                    Caption = 'Create &Relcassification';
                    Image = ExplodeBOM;

                    trigger OnAction();
                    begin
                        IF "Reclass Entry" THEN
                            ERROR(Text006);
                        IF ("Parent IDS No" <> '') THEN
                            ERROR('You cannot reclass')
                        ELSE BEGIN
                            Item.GET("Item No.");
                            ItemTrackingCode.GET(Item."Item Tracking Code");
                            IF (ItemTrackingCode."Lot Specific Tracking") AND (ItemTrackingCode."SN Specific Tracking" = FALSE) THEN
                                CreateReclass
                            ELSE BEGIN
                                //ERROR(Text004);
                                IF "Parent IDS No" <> '' THEN BEGIN
                                    QualityILE.RESET;
                                    QualityILE.SETRANGE("Document No.", "Receipt No.");
                                    QualityILE.SETRANGE("Item No.", "Item No.");
                                    QualityILE.SETRANGE(Select, TRUE);
                                    QualityILE.SETRANGE(QualityILE."Lot No.", "Lot No.");
                                    PAGE.RUN(PAGE::"Partial  IDS QLE", QualityILE);
                                    "Reclass Entry" := TRUE;
                                    "Partial Inspection" := TRUE;
                                    MODIFY;
                                END ELSE BEGIN
                                    QualityILE.RESET;
                                    QualityILE.SETRANGE("Document No.", "Receipt No.");
                                    QualityILE.SETRANGE("Item No.", "Item No.");
                                    QualityILE.SETRANGE(Select, FALSE);
                                    QualityILE.SETRANGE(QualityILE."Lot No.", "Lot No.");
                                    PAGE.RUN(PAGE::"Partial  IDS QLE", QualityILE);
                                    "Reclass Entry" := TRUE;
                                    "Partial Inspection" := TRUE;
                                    MODIFY;
                                END;
                            END;
                        END;
                    end;
                }
                separator(Action1102154010)
                {
                }
                action("Create &Partial IDS")
                {
                    Caption = 'Create &Partial IDS';
                    Image = NewSerialNoProperties;

                    trigger OnAction();
                    begin
                        QualityILE.SETRANGE(QualityILE."Document No.", "Receipt No.");
                        QualityILE.SETRANGE(QualityILE."Item No.", "Item No.");
                        QualityILE.SETRANGE(QualityILE."Child Ids", '');
                        QualityILE.SETRANGE(QualityILE.Select, TRUE);
                        QualityILE.SETRANGE(QualityILE."Lot No.", "Lot No.");
                        IF QualityILE.FINDFIRST THEN BEGIN
                            IF (QualityILE.COUNT <> "Qty in IDS") THEN
                                ERROR('Mismatch in qty');
                        END;

                        IF "Qty in IDS" = 0 THEN
                            ERROR(Text003);
                        IF NOT "Reclass Entry" THEN
                            ERROR(Text005);
                        Item.GET("Item No.");
                        //ItemTrackingCode.GET(Item."Item Tracking Code");
                        //IF ItemTrackingCode."Lot Specific Tracking" THEN
                        CreatePartialIDS
                        /*ELSE
                          ERROR(Text004);*/

                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = Post;
                    ShortCutKey = 'F11';

                    trigger OnAction();
                    begin
                        TESTFIELD(Status, Status::Released);
                        IF "Source Type" = "Source Type"::"In Bound" THEN BEGIN                                                      //modified by Swarupa on 12-01-09)
                            attachment.SETFILTER(attachment."Document No.", "No.");
                            IF attachment.FINDFIRST THEN BEGIN
                                IF (attachment."Attachment Status" = false) THEN
                                    ERROR('Please Attach a Document to post IDS');
                            END ELSE
                                ERROR('Please Attach a Document to post IDS');

                        END;

                        IF NOT "Partial Inspection" THEN BEGIN
                            IF CONFIRM('Do you want to post the Inspection Data Sheets?') THEN BEGIN
                                IF ("Trans. Order No." <> '') THEN
                                    PostInspectData.TransferOrderPostIDS(Rec)
                                ELSE
                                    PostInspectData.RUN(Rec);
                                CurrPage.UPDATE;
                            END;
                        END ELSE BEGIN
                            TotalQtyinIds := 0;
                            TotalQtyinPostedIds := 0;
                            InspectDataSheet2.SETRANGE("Parent IDS No", "No.");
                            InspectDataSheet2.SETRANGE("Partial Inspection", FALSE);
                            IF InspectDataSheet2.FINDSET THEN BEGIN
                                REPEAT
                                    TotalQtyinIds += InspectDataSheet2.Quantity;
                                UNTIL InspectDataSheet2.NEXT = 0;
                            END;
                            PostInspectDataSheet2.SETRANGE("Parent IDS No", "No.");
                            PostInspectDataSheet2.SETRANGE("Partial Inspection", FALSE);
                            IF PostInspectDataSheet2.FINDSET THEN BEGIN
                                REPEAT
                                    TotalQtyinPostedIds += PostInspectDataSheet2.Quantity;
                                UNTIL PostInspectDataSheet2.NEXT = 0;
                            END;
                            IF ((TotalQtyinIds + TotalQtyinPostedIds) <> Quantity) THEN
                                ERROR(Text002)


                            ELSE
                                IF CONFIRM('Do you want to post the Inspection Data Sheets?') THEN BEGIN
                                    IF ("Trans. Order No." <> '') THEN
                                        PostInspectData.TransferOrderPostIDS(Rec)
                                    ELSE
                                        PostInspectData.RUN(Rec);
                                    CurrPage.UPDATE;
                                END;
                        END;
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction();
                    begin
                        InspectDataSheet.SETRANGE("No.", "No.");
                        REPORT.RUN(33000250, TRUE, FALSE, InspectDataSheet);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnInit();
    begin
        "Qty in IDSEditable" := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        CALCFIELDS("Total Qty in IDS");
        IF "Parent IDS No" <> '' THEN
            "Qty in IDSEditable" := FALSE
        ELSE
            "Qty in IDSEditable" := TRUE
    end;

    var
        TEXT000: Label 'Actual values are not entered for %1 lines.\Do You want to release the Document?';
        DataSheetLine: Record "Inspection Datasheet Line";
        PostInspectData: Codeunit "Post-Inspection Data Sheet";
        check: Boolean;
        TEXT001: Label 'Do You want to release the Document?';
        InspectDataSheet: Record "Inspection Datasheet Header";
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
        attachment: Record Attachments;
        CalProHeader: Record "Calibration Procedure Header";
        Text002: Label 'Partial Inspection Data sheet can not be posted.';
        Text003: Label 'Qty in IDS should not be zero.';
        Item: Record Item;
        ItemTrackingCode: Record "Item Tracking Code";
        Text004: Label 'Partial IDS can be created only for Lot specific tracking.';
        Text005: Label 'Make  Reclassification before the Partial IDS creation.';
        Text006: Label '"Create Partial IDS for previous reclassification. "';
        TotalQtyinIds: Decimal;
        TotalQtyinPostedIds: Decimal;
        InspectDataSheet2: Record "Inspection Datasheet Header";
        PostInspectDataSheet2: Record "Posted Inspect DatasheetHeader";
        ItemTracking: Record "Item Tracking Code";
        QualityILE: Record "Quality Item Ledger Entry";
        IDS_Qty: Integer;
        [InDataSet]
        "Qty in IDSEditable": Boolean;


    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        SETRANGE("No.");

        IF "Parent IDS No" <> '' THEN
            "Qty in IDSEditable" := FALSE
        ELSE
            "Qty in IDSEditable" := TRUE
    end;
}

