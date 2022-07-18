pageextension 70316 FinishedProductionOrderExt extends "Finished Production Order"
{
    Editable = true;
    layout
    {
        addafter("Source No.")
        {
            field("Sales Order Line No."; Rec."Sales Order Line No.")
            {
                Enabled = TRUE;
                Editable = FieldEditable;
            }
            field("Schedule Line No."; Rec."Schedule Line No.")
            {
                Editable = FieldEditable;
            }
            field("Product Group Code"; Rec."Product Group Code")
            {
                Editable = false;
            }
            field("Item Sub Group Code"; Rec."Item Sub Group Code")
            {
                Editable = false;
            }
            field("Production Order Status"; Rec."Production Order Status")
            {
                Editable = true;
                trigger OnValidate()
                begin
                    Rec.MODIFY;
                end;
            }
            field("Service Order No."; Rec."Service Order No.")
            {
                Editable = false;
            }
            field("Sales Order No."; Rec."Sales Order No.")
            {
                Editable = FieldEditable;
            }
        }
        addafter("Last Date Modified")
        {
            field("Prod Start date"; Rec."Prod Start date")
            {
                Editable = true;
            }
            field("Finished Date"; Rec."Finished Date")
            {
                Editable = false;
            }
            field("User Id"; Rec."User Id")
            {
                Editable = false;
            }
            field("RDSO No"; Rec."RDSO No")
            {

            }
        }
    }

    actions
    {
        addafter("Registered P&ick Lines")
        {
            action(Convert)
            {
                Caption = 'Convert Order';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    //MESSAGE('Under Implementation!');
                    PAGE.RUN(PAGE::"Convert Sale Order", Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\GRAVI'] THEN
            FieldEditable := TRUE
        ELSE
            FieldEditable := FALSE;
    end;

    var
        FieldEditable: Boolean;
}