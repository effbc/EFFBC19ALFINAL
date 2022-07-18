pageextension 70306 "Prod. BOM Where-Used" extends 99000811
{
    layout
    {
        // Add changes to page layout here
        addafter("Version Code")
        {
            field("Level Code"; Rec."Level Code")
            {

            }
            field(Status; Rec.Status)
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