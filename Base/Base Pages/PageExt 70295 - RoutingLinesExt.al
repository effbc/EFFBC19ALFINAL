pageextension 70295 RoutingLinesExt extends "Routing Lines"
{
    layout
    {
        addafter("Operation No.")
        {
            field("Operation Description"; Rec."Operation Description")
            {

            }
            field(Recalculate; Rec.Recalculate)
            {

            }
        }
        addafter("Next Operation No.")
        {
            field("Sub Assembly"; Rec."Sub Assembly")
            {

            }
            field("QAS/MPR"; Rec."QAS/MPR")
            {

            }
            field("Qty. Produced"; Rec."Qty. Produced")
            {
                Visible = false;
            }
            field("Sub Assembly Unit of Meas.Code"; Rec."Sub Assembly Unit of Meas.Code")
            {
                Visible = false;
            }
            field("Spec Id"; Rec."Spec Id")
            {

            }
            field("QC Enabled"; Rec."QC Enabled")
            {

            }
            field("Sub Assembly Description"; Rec."Sub Assembly Description")
            {
                Visible = false;
            }
        }
        addafter(Description)
        {
            field(Start_Day; Rec.Start_Day)
            {

            }
        }
        addafter("Unit Cost per")
        {
            field("Work Center Group Code"; Rec."Work Center Group Code")
            {

            }
            field("Main Group"; Rec."Main Group")
            {

            }
            field("Sub Group"; Rec."Sub Group")
            {

            }
            field("Operation Number"; Rec."Operation Number")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin

        IF USERID <> 'EFFTRONICS\VISHNUPRIYA' THEN BEGIN
            Rec.SETCURRENTKEY("Routing No.", "Version Code", "Operation No.");
            Rec.SETFILTER("Operation No.", '<>%1', '');
            IF Rec.FINDSET THEN
                REPEAT
                BEGIN
                    IF FORMAT(Rec.Start_Day) = '' THEN
                        ERROR('Fill the Start day for the Activity');
                END
                UNTIL Rec.NEXT = 0;
        END
    end;

    var
        myInt: Integer;
}