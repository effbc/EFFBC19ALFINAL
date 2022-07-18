pageextension 70293 MachineCenterListExt extends "Machine Center List"
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {

            }
        }
        addafter("Work Center No.")
        {
            field(Blocked; Rec.Blocked)
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