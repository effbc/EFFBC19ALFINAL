page 60146 "CS Material Returns"
{
    // version MI1.0,Rev01

    PageType = Document;
    SourceTable = "Material Issues Header";
    SourceTableView = WHERE("Transfer-to Code" = FILTER('CS STR'), "Transfer-from Code" = FILTER('<>STR'), "Reason Code" = FILTER('<>DAMAGE'));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field("No."; "No.")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Transfer-from Code"; "Transfer-from Code")
                {
                    Editable = false;
                }
                field("Transfer-to Code"; "Transfer-to Code")
                {
                    Editable = false;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                    Editable = false;
                }
                field("Production BOM No."; "Production BOM No.")
                {
                    Editable = false;
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    Editable = false;
                }
                field("Service Order No."; "Service Order No.")
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    Editable = true;
                    Enabled = true;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Released By"; "Released By")
                {
                    Caption = 'User id';
                    Editable = false;
                }
                field("Required Date"; "Required Date")
                {
                    Editable = false;
                }
                field("Released Date"; "Released Date")
                {
                    Editable = false;
                }
                field("User ID"; "User ID")
                {
                    Caption = 'Released BY';
                    Editable = false;
                }
                field("Resource Name"; "Resource Name")
                {
                    Editable = false;
                }
                field("Due Date"; "Due Date")
                {
                    Editable = false;
                }
                field("Released Time"; "Released Time")
                {
                    Editable = false;
                }
                field("Reason Code"; "Reason Code")
                {
                    Editable = false;
                }
                field("Devide By Qty."; "Devide By Qty.")
                {
                    Editable = false;
                }
            }
            part(MaterialIssueLine; "Material Issue Subform")
            {
                SubPageLink = "Document No." = FIELD("No.");
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
                    RunObject = Page "Material Issue Statistics";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                    Visible = false;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    RunObject = Page 5750;
                    RunPageLink = "Document Type" = CONST("Material Issues"), "No." = FIELD("No.");
                    Visible = false;
                }
                action("Iss&ues")
                {
                    Caption = 'Iss&ues';
                    Image = Error;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Material Issue No." = FIELD("No.");
                }
            }
        }
        area(processing)
        {
            //Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Release MaterialIssue Document";
                    ShortCutKey = 'Ctrl+F9';
                }
                action("Reo&pen")
                {
                    Caption = 'Reo&pen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ReleaseMaterialIssueDoc: Codeunit "Release MaterialIssue Document";
                    begin
                        ReleaseMaterialIssueDoc.Reopen(Rec);
                    end;
                }
                separator(Action1000000119)
                {
                }
                action("Copy &Production Order")
                {
                    Caption = 'Copy &Production Order';
                    Image = "Order";

                    trigger OnAction();
                    begin
                        TESTFIELD("Transfer-from Code");
                        TESTFIELD("Transfer-to Code");
                        TESTFIELD("Prod. Order No.");
                        TESTFIELD("Prod. Order Line No.");
                        CopyProductionOrder;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Copy &Sale Order")
                {
                    Caption = 'Copy &Sale Order';
                    Image = Sales;

                    trigger OnAction();
                    begin
                        TESTFIELD("Sales Order No.");
                        CopySalesOrder;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Copy &Requisition")
                {
                    Caption = 'Copy &Requisition';
                    Visible = false;

                    trigger OnAction();
                    begin
                        CopyRequisition;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Copy Production &BOM")
                {
                    Caption = 'Copy Production &BOM';
                    Image = CopyBOM;

                    trigger OnAction();
                    begin
                        TESTFIELD("Production BOM No.");
                        CopyProductionBOM;
                    end;
                }
                separator(Action1000000126)
                {
                }
                action("Assign Batch No's")
                {
                    Caption = 'Assign Batch No''s';
                    Image = CreateSerialNo;
                    RunObject = Codeunit "Assign Batch No's";
                }
                separator(Action1000000022)
                {
                }
                action("Calculate Quantity")
                {
                    Caption = 'Calculate Quantity';
                    Image = Calculate;

                    trigger OnAction();
                    var
                        MaterialIssueLine: Record "Material Issues Line";
                    begin
                        MaterialIssueLine.SETRANGE("Document No.", "No.");
                        IF MaterialIssueLine.FINDSET THEN
                            REPEAT
                                IF (MaterialIssueLine.Quantity > 1) AND ("Devide By Qty." <> 0) THEN BEGIN
                                    MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (MaterialIssueLine.Quantity / "Devide By Qty."));
                                    MaterialIssueLine.MODIFY;
                                END;
                            UNTIL MaterialIssueLine.NEXT = 0;
                        "Devide By Qty." := 0;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = Post;
                    ShortCutKey = 'F9';
                    trigger OnAction();
                    begin
                        charline := 10;
                        Mail_Body := '';
                        Subject := '';
                        // Mail_From := 'erp@efftronics.com';
                        //Mail_To:='ramadevi@efftronics.net,nayomi@efftronics.net,Shilpa@efftronics.net,';
                        // Mail_To := 'krishnad@efftronics.com';
                        Recipient.Add('krishnad@efftronics.com');
                        // Mail_To:='santhoshk@efftronics.com';
                        Subject := ' ISSUED MATERIAL FROM ' + "Transfer-from Code" + ' TO ' + "Transfer-to Code";
                        IF MaterialIssuesHeader."Transfer-to Code" = 'DAMAGE' THEN
                            Mail_Body += 'Damage By   :' + FORMAT("Resource Name") + '(' + FORMAT("User ID") + ')'
                        ELSE
                            IF (MaterialIssuesHeader."Transfer-to Code" = 'STR') OR (MaterialIssuesHeader."Transfer-to Code" = 'R&D STR') OR
                             (MaterialIssuesHeader."Transfer-to Code" = 'CS STR') THEN
                                Mail_Body += 'Returned By   :' + FORMAT("Resource Name") + '(' + FORMAT("User ID") + ')'
                            ELSE
                                Mail_Body += 'Issued To :' + FORMAT("Resource Name") + '(' + FORMAT("User ID") + ')';

                        Mail_Body += FORMAT(charline);
                        j := 0;
                        Mat_Issue_sLine.SETRANGE(Mat_Issue_sLine."Document No.", "No.");
                        Mat_Issue_sLine.SETFILTER(Mat_Issue_sLine."Qty. to Receive", '>%1', 0);
                        IF Mat_Issue_sLine.FINDSET THEN
                            REPEAT
                                IF ((Mat_Issue_sLine."Item No." = 'METOLGN00017') OR (Mat_Issue_sLine."Item No." = 'METOLGN00035')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00036') OR (Mat_Issue_sLine."Item No." = 'METOLGN00075')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00038') OR (Mat_Issue_sLine."Item No." = 'METOLGN00076')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00084') OR (Mat_Issue_sLine."Item No." = 'METOLGN00111')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00141') OR (Mat_Issue_sLine."Item No." = 'METOLGN00159')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00216') OR (Mat_Issue_sLine."Item No." = 'METOLGN00223')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00233') OR (Mat_Issue_sLine."Item No." = 'METOLGN00234')
                                OR (Mat_Issue_sLine."Item No." = 'METOLGN00034') OR (Mat_Issue_sLine."Item No." = 'METOLGN00086')) THEN BEGIN
                                    Mail_Body += 'Item           :' + Mat_Issue_sLine.Description + '(' + Mat_Issue_sLine."Item No." + ')';
                                    Mail_Body += FORMAT(charline);
                                    Mail_Body += 'Serial No.     :';
                                    Mail_Body += FORMAT(charline);
                                    "Tracking Specification".SETRANGE("Tracking Specification"."Order No.", "No.");
                                    "Tracking Specification".SETRANGE("Tracking Specification"."Order Line No.", Mat_Issue_sLine."Line No.");
                                    IF "Tracking Specification".FINDSET THEN
                                        REPEAT
                                            IF "Tracking Specification"."Serial No." <> '' THEN
                                                Mail_Body += "Tracking Specification"."Serial No." + ','
                                        UNTIL "Tracking Specification".NEXT = 0;

                                    Mail_Body += FORMAT(charline);
                                    j := 1;
                                END;
                            UNTIL Mat_Issue_sLine.NEXT = 0;
                        IF j = 1 THEN BEGIN
                            //  SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Mail_Body, FALSE);
                            EmailMessage.Create(Recipient, Subject, Mail_Body, FALSE);
                            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                            // SMTP_MAIL.Send;
                        END;

                        CODEUNIT.RUN(60011, Rec);
                    end;


                    /* trigger OnAction();
                     begin
                         charline := 10;
                         Mail_Body := '';
                         Subject := '';
                         Mail_From := 'erp@efftronics.com';
                         //Mail_To:='ramadevi@efftronics.net,nayomi@efftronics.net,Shilpa@efftronics.net,';
                         Mail_To := 'krishnad@efftronics.com';
                         // Mail_To:='santhoshk@efftronics.com';
                         Subject := ' ISSUED MATERIAL FROM ' + "Transfer-from Code" + ' TO ' + "Transfer-to Code";
                         IF MaterialIssuesHeader."Transfer-to Code" = 'DAMAGE' THEN
                             Mail_Body += 'Damage By   :' + FORMAT("Resource Name") + '(' + FORMAT("User ID") + ')'
                         ELSE
                             IF (MaterialIssuesHeader."Transfer-to Code" = 'STR') OR (MaterialIssuesHeader."Transfer-to Code" = 'R&D STR') OR
                              (MaterialIssuesHeader."Transfer-to Code" = 'CS STR') THEN
                                 Mail_Body += 'Returned By   :' + FORMAT("Resource Name") + '(' + FORMAT("User ID") + ')'
                             ELSE
                                 Mail_Body += 'Issued To :' + FORMAT("Resource Name") + '(' + FORMAT("User ID") + ')';

                         Mail_Body += FORMAT(charline);
                         j := 0;
                         Mat_Issue_sLine.SETRANGE(Mat_Issue_sLine."Document No.", "No.");
                         Mat_Issue_sLine.SETFILTER(Mat_Issue_sLine."Qty. to Receive", '>%1', 0);
                         IF Mat_Issue_sLine.FINDSET THEN
                             REPEAT
                                 IF ((Mat_Issue_sLine."Item No." = 'METOLGN00017') OR (Mat_Issue_sLine."Item No." = 'METOLGN00035')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00036') OR (Mat_Issue_sLine."Item No." = 'METOLGN00075')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00038') OR (Mat_Issue_sLine."Item No." = 'METOLGN00076')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00084') OR (Mat_Issue_sLine."Item No." = 'METOLGN00111')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00141') OR (Mat_Issue_sLine."Item No." = 'METOLGN00159')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00216') OR (Mat_Issue_sLine."Item No." = 'METOLGN00223')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00233') OR (Mat_Issue_sLine."Item No." = 'METOLGN00234')
                                 OR (Mat_Issue_sLine."Item No." = 'METOLGN00034') OR (Mat_Issue_sLine."Item No." = 'METOLGN00086')) THEN BEGIN
                                     Mail_Body += 'Item           :' + Mat_Issue_sLine.Description + '(' + Mat_Issue_sLine."Item No." + ')';
                                     Mail_Body += FORMAT(charline);
                                     Mail_Body += 'Serial No.     :';
                                     Mail_Body += FORMAT(charline);
                                     "Tracking Specification".SETRANGE("Tracking Specification"."Order No.", "No.");
                                     "Tracking Specification".SETRANGE("Tracking Specification"."Order Line No.", Mat_Issue_sLine."Line No.");
                                     IF "Tracking Specification".FINDSET THEN
                                         REPEAT
                                             IF "Tracking Specification"."Serial No." <> '' THEN
                                                 Mail_Body += "Tracking Specification"."Serial No." + ','
                                         UNTIL "Tracking Specification".NEXT = 0;

                                     Mail_Body += FORMAT(charline);
                                     j := 1;
                                 END;
                             UNTIL Mat_Issue_sLine.NEXT = 0;
                         IF j = 1 THEN BEGIN
                             SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Mail_Body, FALSE);
                             SMTP_MAIL.Send;
                         END;

                         CODEUNIT.RUN(60011, Rec);
                     end;*/
                }
            }
            action("P&rint New")
            {
                Caption = 'P&rint New';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Material Requisition Print";
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    DocPrint: Codeunit 229;
                begin
                    //DocPrint.PrintTransferHeader(Rec);
                    MaterialIssuesHeader.SETRANGE("No.", "No.");
                    REPORT.RUN(70001, TRUE, FALSE, MaterialIssuesHeader);
                end;
            }
            action(Refresh)
            {
                Caption = 'Refresh';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    /*
                    IF Status<>Status::Released THEN
                    BEGIN
                    IF (USERID='SUPER') OR (USERID='05PD012') OR (USERID='EFFTRONICS\MARY') OR (USERID='07TE024') OR (USERID='07CS018')
                       OR (USERID='EFFTRONICS\MANILAL')  THEN
                    BEGIN
                    IF ISCLEAR(SQLConnection) THEN
                      CREATE(SQLConnection);
                    
                    IF ISCLEAR(RecordSet) THEN
                      CREATE(RecordSet);
                    
                    IF ConnectionOpen<>1 THEN
                    BEGIN
                      SQLConnection.ConnectionString :='DSN=salinvoiceuser;UID=salinvoiceuser;PASSWORD=salinvoiceuser;SERVER=oracle_80;';
                      SQLConnection.Open;
                      SQLConnection.BeginTrans;
                      ConnectionOpen:=1;
                    END;
                    SQLQuery := 'select requestid,status from materialauthor where (status=1) and materialauthor.requestid='''+FORMAT("No.")+'''';
                    //MESSAGE(SQLQuery);
                    RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
                    //MESSAGE(FORMAT(RowCount));
                    IF RowCount < -1 THEN
                      ERROR('Request not yet authorized to Refresh the data')
                    ELSE
                    BEGIN
                    IF NOT((RecordSet.BOF) OR (RecordSet.EOF)) THEN
                      RecordSet.MoveFirst;
                    
                    WHILE NOT RecordSet.EOF DO
                      BEGIN
                    
                        IF ("No."=FORMAT(RecordSet.Fields.Item('requestid').Value))  THEN
                        BEGIN
                          VALIDATE(Status,Status::Released);
                          VALIDATE("Released Date",WORKDATE);
                          VALIDATE("Released Time",TIME);
                          VALIDATE("Released By",USERID);
                          "Posting Date":=TODAY;
                          IF "Authorized Date"=0D THEN
                            "Authorized Date":=TODAY;
                          MODIFY;
                          MESSAGE('Data Refreshed');
                        END;
                    
                    
                        RecordSet.MoveNext;
                     END;
                    
                    END;
                    END ELSE
                    ERROR('You Do not Have Permission to Refresh');
                    END ELSE
                    ERROR('The Request has Already in the Released Mode');
                    *///B2B

                end;
            }
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 5750;
                RunPageLink = "Document Type" = CONST("Material Issues"), "No." = FIELD("No.");
                ToolTip = 'Comment';
            }
        }
    }

    var
        MaterialIssuesHeader: Record "Material Issues Header";
        Mat_Issue_sLine: Record "Material Issues Line";
        SMTPSETUP: Record "SMTP SETUP";
        "Mail-Id": Record User;
        Mail_From: Text[150];
        Mail_To: Text[1000];
        Subject: Text[1000];
        Mail_Body: Text[1000];
        Recipient: List of [Text];
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        bodies: Integer;
        //>> ORACLE UPG
        /* objEmailConf: Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000002-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Configuration";
        objEmail: Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000001-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Message";
        flds: Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000564-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Fields";
        fld: Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000569-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Field"; */
        //<< ORACLE UPG
        charline: Char;
        charline2: Char;
        j: Integer;
        "Tracking Specification": Record "Mat.Issue Track. Specification";
        //SMTP_MAIL: Codeunit "SMTP Mail";
        SQLQuery: Text[1000];
        ConnectionOpen: Integer;
        RowCount: Integer;
}

