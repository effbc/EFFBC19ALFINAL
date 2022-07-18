pageextension 70302 ProductionBOMListExt extends "Production BOM List"
{
    layout
    {
        addafter(Control1)
        {
            group(Control1102152006)
            {
                ShowCaption = false;
            }
            group(Control1102152011)
            {
                ShowCaption = false;
                field("xRec.COUNT"; xRec.COUNT)
                {

                }
            }
            group(Control1102152013)
            {
                ShowCaption = false;
                field(Bom_Status_running; Bom_Status_running)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
            }
            group(Control1102152015)
            {
                ShowCaption = false;
                field(Bom_Status_old; Bom_Status_old)
                {
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
            }
        }
        addafter(Description)
        {
            field("Low-Level Code"; Rec."Low-Level Code")
            {

            }
            field("Modified User ID"; Rec."Modified User ID")
            {

            }
            field("Bench Mark Time(In Hours)"; Rec."Bench Mark Time(In Hours)")
            {

            }
            field("Stranded BOM"; Rec."Stranded BOM")
            {

            }

            field("BOM Type"; Rec."BOM Type")
            {

            }

            field("Total No. of Fixing Holes"; Rec."Total No. of Fixing Holes")
            {

            }
            field("Total Soldering Points"; Rec."Total Soldering Points")
            {

            }
            field("Total Soldering Points DIP"; Rec."Total Soldering Points DIP")
            {

            }
            field("Total Soldering Points SMD"; Rec."Total Soldering Points SMD")
            {

            }
            field("Creation Date"; Rec."Creation Date")
            {

            }
        }
        modify(Status)
        {
            trigger OnBeforeValidate()
            begin
                IF (COPYSTR(ProdBOMHeader."No.", 1, 8) <> 'ECMPBPCB') AND (Rec.Status = Rec.Status::Certified) AND NOT (USERID IN ['EFFTRONICS\JHANSI', 'EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA']) THEN
                    ERROR('You dont have permissions to Certify the BOM');
            end;
        }
        addafter("Search Name")
        {
            field(Configuration; Rec.Configuration)
            {

            }
            field("BOM Running Status"; Rec."BOM Running Status")
            {

            }
            field("Inherited From"; Rec."Inherited From")
            {

            }
            field("BOM Category"; Rec."BOM Category")
            {

            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord()
    begin
        Running_bom_flag := FALSE;
        old_bom_flag := FALSE;
        IF Rec."BOM Running Status" = Rec."BOM Running Status"::Running THEN BEGIN
            BOM_No_Clr := TRUE;
            Running_bom_flag := TRUE;
        END
        ELSE
            IF Rec."BOM Running Status" = Rec."BOM Running Status"::Old THEN BEGIN
                BOM_No_Clr := TRUE;
                old_bom_flag := TRUE;
            END
            ELSE BEGIN
                BOM_No_Clr := FALSE;
                Running_bom_flag := FALSE;
                old_bom_flag := FALSE;
            END;
    end;

    var
        ProdBOMHeader: Record "Production BOM Header";
        Bom_Status_running: Label 'Running BOM';
        Bom_Status_old: Label 'Old BOM';
        Running_bom_flag: Boolean;
        old_bom_flag: Boolean;
        BOM_No_Clr: Boolean;
}