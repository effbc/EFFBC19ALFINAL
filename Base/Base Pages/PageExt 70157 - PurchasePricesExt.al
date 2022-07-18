pageextension 70157 PurchasePricesExt extends 7012
{

    layout
    {


        /*modify("Control1")
        {

          

            ShowCaption = false;
        }*/



        addafter("Ending Date")
        {
            field("Maximum Quantity"; Rec."Maximum Quantity")
            {
                ApplicationArea = All;
            }
            field(Make; Rec.Make)
            {
                ApplicationArea = All;
            }
            field("Part Number"; Rec."Part Number")
            {
                ApplicationArea = All;
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {



    }



}

