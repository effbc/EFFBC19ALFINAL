pageextension 70296 RoutingExt extends Routing
{
    layout
    {
        modify(Status)
        {
            trigger OnBeforeValidate()
            begin
                //B2B 1.1
                IF Rec.Status = Rec.Status::Certified THEN BEGIN
                    RoutingLine.SETRANGE("Routing No.", Rec."No.");
                    IF RoutingLine.FINDLAST THEN BEGIN
                        RoutingLine."QC Enabled" := FALSE;
                        RoutingLine.MODIFY;
                    END;
                END;
                //B2B 1.1
            end;
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {

            }
        }
        addafter(Status)
        {
            field("Created User Id"; Rec."User Id")
            {
                Caption = 'Created User Id';
            }
            field("Modifef User ID"; Rec."Modifef User ID")
            {

            }
        }
        addafter("Last Date Modified")
        {
            field("Man Cost"; Rec."Man Cost")
            {

            }
            field("Tot Man Cost/Hour"; Rec."Tot Man Cost/Hour")
            {

            }
            field("Bench Mark Time(In Hours)"; Rec."Bench Mark Time(In Hours)")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."User Id" := USERID;
    end;

    var
        RoutingLine: Record "Routing Line";
}