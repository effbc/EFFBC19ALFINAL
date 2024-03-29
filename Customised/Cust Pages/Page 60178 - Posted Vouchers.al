page 60178 "Posted Vouchers"
{
    // version Rev01

    Editable = false;
    PageType = List;
    Permissions = TableData "G/L Entry" = rimd;
    SourceTable = "G/L Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Payment Through"; Rec."Payment Through")
                {
                    ApplicationArea = All;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("customer Ord No"; Rec."customer Ord No")
                {
                    ApplicationArea = All;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("System-Created Entry"; Rec."System-Created Entry")
                {
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = All;
                }
                field("Sale Order No."; Rec."Sale Order No.")
                {
                    ApplicationArea = All;
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = All;
                }
            }
            group(Control1102152035)
            {
                ShowCaption = false;
                field("Rec.COUNT"; Rec.COUNT)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Entry)
            {
                Caption = 'Entry';
                action(Dimensions)
                {
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("G/L Dimension Overview")
                {
                    Image = DimensionSets;
                    ApplicationArea = All;

                    trigger OnAction();
                    var
                        GLEntriesDimOverview: Page "G/L Entries Dimension Overview";
                    begin
                        IF RunOnTempRec THEN BEGIN
                            GLEntriesDimOverview.SetTempGLEntry(TempGLEntry);
                            GLEntriesDimOverview.RUN;
                        END ELSE
                            PAGE.RUN(PAGE::"G/L Entries Dimension Overview", Rec);
                    end;
                }
                action(Navigate)
                {
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F6';
                    ApplicationArea = All;

                    trigger OnAction();
                    begin

                        Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                        Navigate.RUN;
                    end;
                }
            }
        }
        area(reporting)
        {
            group(Action1102152027)
            {
                action(Print)
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction();
                    var
                        "G/LEntry": Record "G/L Entry";
                        DGLE: Record "Detailed GST Ledger Entry";
                    begin
                        DGLE.RESET;
                        DGLE.SETRANGE("Transaction Type", DGLE."Transaction Type"::Purchase, DGLE."Transaction Type"::Sales);
                        DGLE.SETRANGE("Document Type", DGLE."Document Type"::Payment);
                        DGLE.SETRANGE("Document No.", Rec."Document No.");
                        DGLE.SETRANGE("Posting Date", Rec."Posting Date");
                        DGLE.SETFILTER("GST Amount", '<>%1', 0);
                        IF DGLE.FINDFIRST THEN
                            REPORT.RUNMODAL(33000907, TRUE, TRUE, DGLE)
                        ELSE BEGIN
                            "G/LEntry".SETRANGE("Document No.", Rec."Document No.");
                            "G/LEntry".SETRANGE("Posting Date", Rec."Posting Date");
                            "G/LEntry".SETRANGE("Document Type", Rec."Document Type");
                            "G/LEntry".SETRANGE("Payment Type", Rec."Payment Type");
                            IF "G/LEntry".FINDFIRST THEN
                                REPORT.RUNMODAL(33000907, TRUE, TRUE, "G/LEntry");
                        END;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.SETRANGE("Posting Date", (DMY2Date(04, 01, 08)), (DMY2Date(31, 03, 2035)));
    end;

    var
        Navigate: Page Navigate;
        GLAcc: Record "G/L Account";
        TempGLEntry: Record "G/L Entry" temporary;
        AnalysisViewEntry: Record "Analysis View Entry";
        RunOnTempRec: Boolean;
        ReportPrint: Codeunit 228;


    procedure SetAnalysisViewEntry(var NewAnalysisViewEntry: Record "Analysis View Entry");
    var
        AnalysisViewEntryToGLEntries: Codeunit AnalysisViewEntryToGLEntries;
    begin
        AnalysisViewEntry := NewAnalysisViewEntry;
        RunOnTempRec := TRUE;
        AnalysisViewEntryToGLEntries.GetGLEntries(AnalysisViewEntry, TempGLEntry);
    end;


    local procedure GetCaption(): Text[250];
    begin
        IF GLAcc."No." <> Rec."G/L Account No." THEN
            IF NOT GLAcc.GET(Rec."G/L Account No.") THEN
                IF Rec.GETFILTER("G/L Account No.") <> '' THEN
                    IF GLAcc.GET(Rec.GETRANGEMIN("G/L Account No.")) THEN;
        EXIT(STRSUBSTNO('%1 %2', GLAcc."No.", GLAcc.Name))
    end;
}

