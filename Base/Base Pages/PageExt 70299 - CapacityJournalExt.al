pageextension 70299 CapacityJournalExt extends "Capacity Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field(Remarks; Rec.Remarks)
            {

            }
        }
        addafter(Type)
        {
            field(Quantity; Rec.Quantity)
            {

            }
            field("Location Code"; Rec."Location Code")
            {

            }
        }
        addafter(CapDescription)
        {
            group("Work Date")
            {
                Caption = 'Work Date';
                field(WorkDate; WorkDate)
                {

                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Gen. Prod. Posting Group" := 'MISC';
        Rec.Type := Rec.Type::"Machine Center";
    end;

    var
        myInt: Integer;
}