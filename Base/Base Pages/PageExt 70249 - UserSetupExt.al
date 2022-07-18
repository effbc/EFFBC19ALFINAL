pageextension 70249 UserSetupExt extends "User Setup"
{
    Editable = false;
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */

        addafter("User ID")
        {
            field("Transfer- From Code"; Rec."Transfer- From Code")
            {
                ApplicationArea = All;
            }
            field("Transfer- To Code"; Rec."Transfer- To Code")
            {
                ApplicationArea = All;
            }
            field("Production Order"; Rec."Production Order")
            {
                ApplicationArea = All;
            }
        }
    }
}

