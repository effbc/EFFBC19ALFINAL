pageextension 70211 ServiceListCustExt extends 5901
{


    layout
    {


        /* modify("Control1")
         {



             ShowCaption = false;
         }*/


        addafter(Name)
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Control1")
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {



    }




}

