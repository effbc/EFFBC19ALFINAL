page 60269 "Quote Specification"
{
    // version B2BQTO

    Caption = 'Quote Specification';
    PageType = Worksheet;
    SourceTable = "Quote Specifications";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("LookUp Code"; Rec."LookUp Code")
                {
                    TableRelation = "Quote Lookup"."Lookup Code" WHERE("Lookup Type ID" = FILTER(4));
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        QuoteLookUpType.RESET;
                        QuoteLookUpType.SETRANGE("Lookup Code", "LookUp Code");
                        IF QuoteLookUpType.FINDFIRST THEN
                            "Lookup Name" := QuoteLookUpType.Description;
                    end;
                }
                field("Lookup Name"; "Lookup Name")
                {
                }
                field(Item; Item)
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        QuoteLookUpType: Record "Quote Lookup";
}

