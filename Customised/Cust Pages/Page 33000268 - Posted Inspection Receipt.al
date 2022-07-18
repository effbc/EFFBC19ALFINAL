page 33000268 "Posted Inspection Receipt"
{
    // version QC1.1,Cal1.0,RQC1.0,Rev01

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = WHERE(Status = FILTER(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = EditableOrNot;
                    ApplicationArea = All;
                }
                field("Spec ID"; Rec."Spec ID")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("IDS Posted By"; Rec."IDS Posted By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("IR Posted By"; Rec."IR Posted By")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Rework Reference No."; Rec."Rework Reference No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Stock Rcvd from QC"; Rec."Stock Rcvd from QC")
                {
                    ApplicationArea = All;
                }
                field("Source Type"; Rec."Source Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = EditableOrNot;
                    ApplicationArea = All;
                }
                field(Make; Rec.Make)
                {
                    Editable = EditableOrNot;
                    ApplicationArea = All;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            part(InpectionReceiptLine; "Inpection Receipt Line")
            {
                Editable = false;
                SubPageLink = "Document No." = FIELD("No."), "Purch Line No." = FIELD("Purch Line No");
            }
            group(Receipt)
            {
                Caption = 'Receipt';
                field("Vendor No."; Rec."Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Editable = false;
                }
                field("Vendor Name 2"; Rec."Vendor Name 2")
                {
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    Editable = false;
                }
                field("Address 2"; Rec."Address 2")
                {
                    Editable = false;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    Editable = false;
                }
                field("Created time"; Rec."Created time")
                {
                    Editable = false;
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    Editable = false;
                }
                field("Order No."; Rec."Order No.")
                {
                    Editable = false;
                }
                field("Purch Line No"; Rec."Purch Line No")
                {
                    Editable = false;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Editable = false;
                }
                field("Purchase Consignment"; Rec."Purchase Consignment")
                {
                }
                field("Item Tracking Exists"; Rec."Item Tracking Exists")
                {
                    Editable = false;
                }
                field("Quality Before Receipt"; Rec."Quality Before Receipt")
                {
                }
            }
            group(Production)
            {
                Caption = 'Production';
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    Editable = false;
                }
                field("Prod. Order Line"; Rec."Prod. Order Line")
                {
                    Editable = false;
                }
                field("Routing No."; Rec."Routing No.")
                {
                    Editable = false;
                }
                field("Routing Reference No."; Rec."Routing Reference No.")
                {
                    Editable = false;
                }
                field("Operation No."; Rec."Operation No.")
                {
                    Editable = false;
                }
                field("Prod. Description"; Rec."Prod. Description")
                {
                    Editable = false;
                }
                field("Operation Description"; Rec."Operation Description")
                {
                    Editable = false;
                }
                field("Production Batch No."; Rec."Production Batch No.")
                {
                    Editable = false;
                }
                field("Sub Assembly Code"; Rec."Sub Assembly Code")
                {
                    Editable = false;
                }
                field("Sub Assembly Description"; Rec."Sub Assembly Description")
                {
                    Editable = false;
                }
                field("In Process"; Rec."In Process")
                {
                    Editable = false;
                }
                field("OutPut Jr Serial No."; Rec."OutPut Jr Serial No.")
                {
                }
                field("Finished Product Sr No"; Rec."Finished Product Sr No")
                {
                }
                field("Rework User"; Rec."Rework User")
                {
                }
                field(Resource; Rec.Resource)
                {
                    Editable = false;
                }
            }
            group(Inspection)
            {
                Caption = 'Inspection';
                field("<Quantity2>"; Rec.Quantity)
                {
                    Editable = EditableOrNot;
                }
                field("Qty. Accepted"; Rec."Qty. Accepted")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        Rec.QualityAcceptanceLevels(QualityType::Accepted);
                    end;
                }
                field("Qty. Accepted Under Deviation"; Rec."Qty. Accepted Under Deviation")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        Rec.QualityAcceptanceLevels(QualityType::"Accepted Under Deviation");
                    end;
                }
                field("Qty. Rework"; Rec."Qty. Rework")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        Rec.QualityAcceptanceLevels(QualityType::Rework);
                    end;
                }
                field("Qty. Rejected"; Rec."Qty. Rejected")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        Rec.QualityAcceptanceLevels(QualityType::Rejected);
                    end;
                }
                field("Qty. Accepted UD Reason"; Rec."Qty. Accepted UD Reason")
                {
                    Editable = EditableOrNot;
                }
                field("Reason Description"; Rec."Reason Description")
                {
                    Editable = false;
                }
                field("Nature Of Rejection"; Rec."Nature Of Rejection")
                {
                    Editable = true;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                }
                field("New Location Code"; Rec."New Location Code")
                {
                    Editable = false;
                }
                field("Rework Completed"; Rec."Rework Completed")
                {
                    Editable = false;
                }
                field("Qty. To Receive(Rework)"; Rec."Qty. To Receive(Rework)")
                {
                }
                field("Rejection Category"; Rec."Rejection Category")
                {
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                }
                field(Flag; Rec.Flag)
                {

                    trigger OnValidate();
                    begin
                        // Added by Vishnu Priya to log the flag cleared time.
                        IF Rec.Flag = FALSE THEN BEGIN
                            Rec."Flag Cleared Date" := TODAY;
                            Rec.MODIFY;
                        END;
                        // Added by Vishnu Priya to log the flag cleared time.

                        // Added by Vishnu Priya on 30-06-2020 for avoiding the muti time flag for the same vendor.
                        IF Rec.Flag = TRUE THEN BEGIN
                            IRH.RESET;
                            IRH.SETCURRENTKEY(Flag, "Item No.", "Vendor No.");
                            IRH.SETRANGE(Flag, TRUE);
                            IRH.SETFILTER("Item No.", Rec."Item No.");
                            IRH.SETFILTER("Vendor No.", Rec."Vendor No.");
                            IF IRH.FINDFIRST THEN
                                ERROR('Item was QC Flagged with the same vendor in IR Number: ' + IRH."No.");
                        END;
                        // Added by Vishnu Priya on 30-06-2020 for avoiding the muti time flag for the same vendor.
                    end;
                }
                field("MBB Status"; Rec."MBB Status")
                {
                    Editable = false;
                }
                field("HIC 60%"; Rec."HIC 60%")
                {
                    Editable = false;
                }
                field("HIC 10%"; Rec."HIC 10%")
                {
                    Editable = false;
                }
                field("HIC 5%"; Rec."HIC 5%")
                {
                    Editable = false;
                }
                field("MBB Packet Open DateTime"; Rec."MBB Packet Open DateTime")
                {
                    Editable = false;
                }
                field("MBB Packet Close DateTime"; Rec."MBB Packet Close DateTime")
                {
                    Editable = false;
                }
                field("Baked Hours"; Rec."Baked Hours")
                {
                    Editable = false;
                }
                field("MFD Date"; Rec."MFD Date")
                {
                    Editable = false;
                }
                field("Packed Date"; Rec."Packed Date")
                {
                    Editable = false;
                }
                field("Action Required"; Rec."Action Required")
                {

                    trigger OnValidate();
                    begin
                        /*
                        //added by vishnu priya on 12th Nov 2019 for the QC Flag Analysis
                        Fieldedit := FALSE;
                        IF Rec."Action Required" = TRUE THEN
                          Fieldedit := TRUE
                        ELSE
                          Fieldedit := FALSE;
                        //end by vishnu priya on 12th Nov 2019 for the QC Flag Analysis
                        */
                        //Fieldedit := TRUE;

                        //B2BOTS >>
                        IF Rec."Action Required" THEN
                            FieldValueEdit := TRUE
                        ELSE
                            FieldValueEdit := FALSE;

                        IF NOT Rec."Action Required" THEN
                            Rec."Action Completed time" := CURRENTDATETIME;

                    end;
                }
                field("Action To Be Taken"; Rec."Action To Be Taken")
                {
                    Editable = Supervisor;
                }
                field("Tentative Clearance Date"; Rec."Tentative Clearance Date")
                {
                    Editable = true;
                }
                field("Flag Cleared Date"; Rec."Flag Cleared Date")
                {
                    Editable = false;
                }
                field("Concerned Dept"; Rec."Concerned Dept")
                {
                    Editable = true;
                }
                field("Action Completed time"; Rec."Action Completed time")
                {
                    Editable = false;
                }
                field("MBB Packed Date"; Rec."MBB Packed Date")
                {
                    Editable = false;
                }
            }
            group(Returns)
            {
                Caption = 'Returns';
                field("<Qty. Rework2>"; Rec."Qty. Rework")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        Rec.QualityAcceptanceLevels(QualityType::Rework);
                    end;
                }
                field("Qty. To Vendor (Rework)"; Rec."Qty. To Vendor (Rework)")
                {
                }
                field("Qty. Sent To Vendor (Rework)"; Rec."Qty. Sent To Vendor (Rework)")
                {
                    Editable = false;
                }
                field("<Qty. Rejected2>"; Rec."Qty. Rejected")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        Rec.QualityAcceptanceLevels(QualityType::Rejected);
                    end;
                }
                field("Qty. To Vendor (Rejected)"; Rec."Qty. To Vendor (Rejected)")
                {
                }
                field("Qty. Sent To Vendor (Rejected)"; Rec."Qty. Sent To Vendor (Rejected)")
                {
                    Editable = false;
                }
                field("Rework Reference Document No."; Rec."Rework Reference Document No.")
                {
                    MultiLine = true;

                    trigger OnValidate();
                    begin
                        IF DeliveryReceiptEntry.GET(Rec."Rework Reference Document No.") THEN
                            Rec."Qty. To Receive(Rework)" := DeliveryReceiptEntry."Remaining Quantity";
                    end;
                }
                field("<Qty. To Receive(Rework)2>"; Rec."Qty. To Receive(Rework)")
                {

                    trigger OnValidate();
                    begin
                        Rec.TESTFIELD("Rework Reference Document No.");
                        IF Rec."Rework Reference Document No." <> 0 THEN BEGIN
                            IF DeliveryReceiptEntry.GET(Rec."Rework Reference Document No.") THEN
                                IF Rec."Qty. To Receive(Rework)" > DeliveryReceiptEntry."Remaining Quantity" THEN
                                    ERROR('You can not receive more against this refernce document no.');
                        END;
                        /*
                        IF "Qty. To Receive(Rework)" MOD (Quantity/"Quantity(Base)") <> 0 THEN
                          ERROR('Enter Quantity equivalent to Pieces');
                        */

                    end;
                }
                field("Qty. Received(Rework)"; Rec."Qty. Received(Rework)")
                {
                    Editable = false;
                }
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field("<Vendor No.2>"; Rec."Vendor No.")
                {
                }
                field("<Vendor Name2>"; Rec."Vendor Name")
                {
                }
                field("<Address2>"; Rec.Address)
                {
                }
                field("<Address 3>"; Rec."Address 2")
                {
                }
                field("<Contact Person2>"; Rec."Contact Person")
                {
                }
                field("Calibration Status"; Rec."Calibration Status")
                {
                }
                field(Results; Rec.Results)
                {
                }
                field(Recommendations; Rec.Recommendations)
                {
                }
                field("Calibration Party"; Rec."Calibration Party")
                {
                }
                field("<Resource2>"; Rec.Resource)
                {
                }
                field("Eqpt. Serial No."; Rec."Eqpt. Serial No.")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Std. Reference"; Rec."Std. Reference")
                {
                }
                field("Least Count"; Rec."Least Count")
                {
                }
                field("Measuring Range"; Rec."Measuring Range")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
            }
            group(Others)
            {
                Caption = 'Others';
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                }
                field("Item Sub Group Code"; Rec."Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code"; Rec."Item Sub Sub Group Code")
                {
                }
                field("IDS creation Date"; Rec."IDS creation Date")
                {
                    Editable = false;
                }
                field("No. of Opportunities"; Rec."No. of Opportunities")
                {
                }
                field("No.of Fixing Holes"; Rec."No.of Fixing Holes")
                {
                }
                field("No. of Soldering Points"; Rec."No. of Soldering Points")
                {
                }
                field("No. of Pins"; Rec."No. of Pins")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Reason for Pending"; Rec."Reason for Pending")
                {
                    Editable = false;
                }
            }
            group("Purchase Followup")
            {
                Caption = 'Purchase Followup';
                field("Reject/Rework Note No."; Rec."Reject/Rework Note No.")
                {
                    Editable = rej_note_edit;
                }
                field("Purchase Status"; Rec."Purchase Status")
                {
                    Editable = pur_editable;
                }
                field("Debit Note No."; Rec."Debit Note No.")
                {
                }
                field("Rework Sent Date"; Rec."Rework Sent Date")
                {
                    Editable = pur_editable;
                }
                field("Rework Status"; Rec."Rework Status")
                {
                    Editable = pur_editable;
                }
                field("Expected Recv Date"; Rec."Expected Recv Date")
                {
                    Caption = 'Expected Receive Date';
                    Editable = pur_editable;
                }
                field("Received Date"; Rec."Received Date")
                {
                    Editable = pur_editable;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                Image = Receipt;
                action("Posted &Inspect. DS Details")
                {
                    Caption = 'Posted &Inspect. DS Details';
                    Image = ViewDetails;
                    RunObject = Page "Posted Inspect. DS Details";
                    RunPageLink = "Inspection Receipt No." = FIELD("No.");
                }
                action("&Rework Receipts")
                {
                    Caption = '&Rework Receipts';
                    Image = ReturnReceipt;
                    RunObject = Page "Inspection Receipt List";
                    RunPageLink = "Rework Reference No." = FIELD("No.");
                }
                separator("----")
                {
                    Caption = '----';
                }
                action("&Purchase Receipt")
                {
                    Caption = '&Purchase Receipt';
                    Image = TransferReceipt;
                    RunObject = Page "Posted Purchase Receipt";
                    RunPageLink = "No." = FIELD("Receipt No.");
                }
                separator(Action1102152012)
                {
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                Image = Item;
                action("Ro&uting")
                {
                    Caption = 'Ro&uting';
                    Image = Item;

                    trigger OnAction();
                    begin

                        Rec.TESTFIELD("Qty. Rework");
                        Rec.TESTFIELD("Prod. Order No.");
                        Rec.TESTFIELD("Routing Reference No.");
                        Rec.TESTFIELD("Routing No.");

                        ProdOrderInspectRtng.SETRANGE(Status, ProdOrderInspectRtng.Status::Released);
                        ProdOrderInspectRtng.SETRANGE("Prod. Order No.", Rec."Prod. Order No.");
                        ProdOrderInspectRtng.SETRANGE("Routing Reference No.", Rec."Routing Reference No.");
                        ProdOrderInspectRtng.SETRANGE("Routing No.", Rec."Routing No.");
                        ProdOrderInspectRtng.SETRANGE("Inspection Receipt No.", Rec."No.");

                        PAGE.RUN(PAGE::"Inspect Prod. Order Routing", ProdOrderInspectRtng);
                    end;
                }
                action(Components)
                {
                    Caption = 'Components';
                    Image = Components;

                    trigger OnAction();
                    begin

                        Rec.TESTFIELD("Qty. Rework");
                        Rec.TESTFIELD("Prod. Order No.");
                        Rec.TESTFIELD("Routing Reference No.");
                        Rec.TESTFIELD("Routing No.");

                        ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                        ProdOrderComp.SETRANGE("Prod. Order No.", Rec."Prod. Order No.");
                        ProdOrderComp.SETRANGE("Prod. Order Line No.", Rec."Prod. Order Line");
                        ProdOrderComp.SETRANGE("Inspection Receipt No.", Rec."No.");

                        PAGE.RUN(PAGE::"Prod. Order Inspect Components", ProdOrderComp);
                    end;
                }
                action("Quality LedgerEntries")
                {
                    Caption = 'Quality LedgerEntries';
                    Image = LedgerEntries;
                    RunObject = Page "Quality Ledger Entries";
                    RunPageLink = "Document No." = FIELD("No.");
                    ShortCutKey = 'Ctrl+F5';
                }
                action("Delivery/Receipt Entries")
                {
                    Caption = 'Delivery/Receipt Entries';
                    Image = Entries;
                    RunObject = Page "Delivery/Receipt Entries";
                    RunPageLink = "Document No." = FIELD("No.");
                }
                separator(Action1102152008)
                {
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;

                    trigger OnAction();
                    begin
                        IF NOT Rec."Quality Before Receipt" THEN
                            Rec.ShowItemTrackingLines;
                    end;
                }
                action("Item &Tracking Lines2")
                {
                    Caption = 'Item &Tracking Lines2';
                    Image = ItemTrackingLines;
                    RunObject = Page "Quality Ledger Entries";
                    RunPageLink = "Document No." = FIELD("No.");
                }
            }
        }
        area(processing)
        {

            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Create Inspection Data &Sheets")
                {
                    Caption = 'Create Inspection Data &Sheets';
                    Image = CreatePutAway;
                    Visible = false;

                    trigger OnAction();
                    begin
                        InspectReceipt.CreateReworkInspectDataSheets(Rec);
                    end;
                }
                action(Rework)
                {
                    Caption = 'Rework';
                    Image = CalculateWIP;

                    trigger OnAction();
                    begin
                        IF Rec."Item Tracking Exists" THEN
                            InspectJnlPostLine.UpdateSentBackToVendor(Rec)
                        ELSE
                            InspectJnlPostLine.FillReworkItemJnlLineAndPost(Rec);
                        UpdateQCCheck(Rec);
                        CurrPage.UPDATE;
                    end;
                }
                action(Receive)
                {
                    Caption = 'Receive';
                    Image = ReceivableBill;

                    trigger OnAction();
                    begin
                        //B2B
                        Rec.TESTFIELD("Qty. To Receive(Rework)");
                        //TESTFIELD("Rework Posted");//RQC1.0 B2B 290508
                        //B2B
                        IF Rec."Item Tracking Exists" THEN
                            InspectJnlPostLine.UpdateReceiveRework(Rec)
                        ELSE
                            InspectJnlPostLine.ReceiveReworkAndPost(Rec);


                        CurrPage.UPDATE;
                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attach;

                    trigger OnAction();
                    begin

                        Attachment.RESET;
                        Attachment.SETRANGE("Table ID", DATABASE::"Inspection Receipt Header");
                        Attachment.SETRANGE("Document No.", Rec."No.");
                        //Attachment.SETRANGE("Document Type","Document Type");

                        PAGE.RUN(PAGE::"ESPL Attachments", Attachment);
                    end;
                }
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
                    InspectRcpt.SETRANGE(InspectRcpt."No.", Rec."No.");
                    REPORT.RUN(33000254, TRUE, FALSE, InspectRcpt);
                    InspectRcpt.SETRANGE(InspectRcpt."No.");
                end;
            }
            action("Rejection NOte mail")
            {
                Visible = false;

                trigger OnAction();
                begin
                    // added by sujani for testing purpose

                    Recipient.Add('erp@efftronics.com');
                    Recipient.Add('sujani@efftronics.com');

                    // SMTP_MAIL.CreateMessage('rejection Note', 'erp@efftronics.com', 'sujani@efftronics.com' 'Rejection Note', Body, TRUE);
                    EmailMessage.Create(Recipient, 'Rejection Note', Body, TRUE);
                    //  IRH.RESET;
                    //  IRH.SETFILTER("No.",Rec."No.");
                    // IF IRH.FINDSET THEN
                    BEGIN
                        FileDirectory := '\\erpserver\ErpAttachments\QC_Rejection_Note\';
                        //FileName:=IRH."No.");
                        //filesub:=COPYSTR("No.",5,5);
                        FileName := 'QC Rejection Note ' + Rec."No." + '.pdf';
                        REPORT.RUN(32000006, FALSE, FALSE, Rec);
                        REPORT.SAVEASPDF(32000006, FileDirectory + FileName, Rec);
                        QC_ATCH := FileDirectory + FileName;

                        // SMTP_MAIL.AddAttachment(QC_ATCH, FileName); //B2BUPG
                        EmailMessage.AddAttachment(QC_ATCH, FileName, '');


                    END;
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        // Added by Rakesh for Permissions in Purchase Details
        IF UPPERCASE(USERID) IN ['EFFTRONICS\PARDHU', 'EFFTRONICS\SIRISHA', 'EFFTRONICS\MNRAJU', 'EFFTRONICS\RAKESHT', 'EFFTRONICS\B2BOTS'] THEN
            rej_note_edit := TRUE
        ELSE
            rej_note_edit := FALSE;

        IF UPPERCASE(USERID) IN ['EFFTRONICS\PARDHU', 'EFFTRONICS\RAKESHT', 'EFFTRONICS\MNRAJU', 'EFFTRONICS\B2BOTS'] THEN
            pur_editable := TRUE
        ELSE
            pur_editable := FALSE;

        IF Rec."Rework Status" = Rec."Rework Status"::Completed THEN BEGIN
            pur_editable := FALSE;
            rej_note_edit := FALSE;
        END;

        IF UPPERCASE(USERID) IN ['EFFTRONICS\ANILKUMAR', 'EFFTRONICS\RAKESHT', 'EFFTRONICS\MNRAJU', 'EFFTRONICS\B2BOTS'] THEN BEGIN
            pur_editable := TRUE;
            rej_note_edit := TRUE
        END;

        IF USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS'] THEN
            EditableOrNot := TRUE
        ELSE
            EditableOrNot := FALSE;
        IF USERID IN ['EFFTRONICS\VIJAYALAKSHMIB'] THEN
            Supervisor := TRUE;
    end;

    var
        Recipient: List of [Text];
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        ProdOrderInspectRtng: Record "Ins Prod. Order Routing Line";
        ProdOrderComp: Record "Prod. Order Inspect Component";
        InspectReceipt: Codeunit "Inspection Data Sheets";
        InspectJnlPostLine: Codeunit "Inspection Jnl.-Post Line";
        InspectRcpt: Record "Inspection Receipt Header";
        QualityType: Option Accepted,"Accepted Under Deviation",Rework,Rejected;
        DeliveryReceiptEntry: Record "Delivery/Receipt Entry";
        Attachment: Record Attachments;
        ItemLedgEntry: Record "Item Ledger Entry";
        Rejection: Record "QC Rejection Master";
        pur_editable: Boolean;
        rej_note_edit: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        QC_ATCH: Text;
        attachments: Record Attachments;
        Fname: Text[250];
        // SMTP_MAIL: Codeunit "SMTP Mail";
        Body: Text;
        Fieldedit: Boolean;
        EditableOrNot: Boolean;
        Supervisor: Boolean;
        FieldValueEdit: Boolean;
        IRH: Record "Inspection Receipt Header";


    procedure UpdateQCCheck(InspRcpt: Record "Inspection Receipt Header");
    begin
        IF InspRcpt."Item Ledger Entry No." <> 0 THEN BEGIN
            IF InspRcpt."Rework Level" = 0 THEN BEGIN
                IF ItemLedgEntry.GET(InspRcpt."Item Ledger Entry No.") THEN BEGIN
                    IF ItemLedgEntry."Remaining Quantity" = 0 THEN
                        ItemLedgEntry."QC Check" := FALSE;
                    ItemLedgEntry.MODIFY;
                END;
            END ELSE BEGIN
                IF ItemLedgEntry.GET(InspRcpt."DC Inbound Ledger Entry.") THEN BEGIN
                    IF ItemLedgEntry."Remaining Quantity" = 0 THEN
                        ItemLedgEntry."QC Check" := FALSE;
                    ItemLedgEntry.MODIFY;
                END;
            END;
        END;
    end;
}

