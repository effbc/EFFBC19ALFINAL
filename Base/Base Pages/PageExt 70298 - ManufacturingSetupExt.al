pageextension 70298 ManufacturingSetupExt extends "Manufacturing Setup"
{

    layout
    {
        addafter("Cost Incl. Setup")
        {
            field("Total Fixing Points Time"; Rec."Total Fixing Points Time")
            {

            }
            field("Production Location"; Rec."Production Location")
            {

            }
            field("Soldering Time Req.for DIP"; Rec."Soldering Time Req.for DIP")
            {

            }
            field("Soldering Time Req.for BID"; Rec."Soldering Time Req.for BID")
            {
                Caption = 'Soldering Time Req.for SMD';
            }
            field("Soldering Cost per Hour"; Rec."Soldering Cost per Hour")
            {

            }
            field("Development Cost Per Hour"; Rec."Development Cost Per Hour")
            {

            }
            field("MI Transfer From Code"; Rec."MI Transfer From Code")
            {

            }
        }
        addafter("Blank Overflow Level")
        {
            field("No. of Units/Day"; Rec."No. of Units/Day")
            {

            }
            field("Consider Exp. Order Material"; Rec."Consider Exp. Order Material")
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