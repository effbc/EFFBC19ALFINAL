pageextension 70311 "Firm Planned Prod. Order Lines" extends "Firm Planned Prod. Order Lines"
{
    layout
    {
        addafter("Variant Code")
        {
            field("WIP Spec Id"; Rec."WIP Spec Id")
            {

            }
            field("WIP QC Enabled"; Rec."WIP QC Enabled")
            {

            }
        }

    }

    actions
    {

    }

    var
        myInt: Integer;
}