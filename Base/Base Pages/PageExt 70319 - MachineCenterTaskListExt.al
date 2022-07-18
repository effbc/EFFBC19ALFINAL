pageextension 70319 MachineCenterTaskListExt extends "Machine Center Task List"
{
    layout
    {
        addafter("Operation No.")
        {
            field("Operation Description"; Rec."Operation Description")
            {

            }
            field("Qty.To Produce"; Rec."Qty.To Produce")
            {
                Visible = false;
            }
            field("Item No."; Rec."Item No.")
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
            field(Quantity; Rec.Quantity)
            {
                Visible = false;
            }
        }
        addafter("Move Time Unit of Meas. Code")
        {
            field("Total Time"; Rec."Total Time")
            {
                Visible = false;
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