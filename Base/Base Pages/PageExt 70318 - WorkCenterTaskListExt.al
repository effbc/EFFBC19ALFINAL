pageextension 70318 WorkCenterTaskListExt extends "Work Center Task List"
{
    layout
    {
        addafter("Prod. Order No.")
        {
            field("Item No."; Rec."Item No.")
            {

            }
            field("Item Description"; Rec."Item Description")
            {

            }
            field("Routing Reference No."; Rec."Routing Reference No.")
            {

            }
        }
        addafter("Operation No.")
        {
            field("Operation Description"; Rec."Operation Description")
            {

            }
        }
        addafter(Description)
        {
            field("Starting Date-Time"; Rec."Starting Date-Time")
            {

            }
            field("Ending Date-Time"; Rec."Ending Date-Time")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}