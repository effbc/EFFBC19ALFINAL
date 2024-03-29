page 60122 "Design Worksheet-Sale"
{
    // version B2B1.0

    Editable = false;
    PageType = Document;
    SourceTable = "Design Worksheet Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Production Bom No."; Rec."Production Bom No.")
                {
                    ApplicationArea = All;
                }
                field("Production Bom Version No."; Rec."Production Bom Version No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(DesignWorksheetLines; "Design Worksheet Subform-Sale")
            {
                SubPageLink = "Document No." = FIELD("Document No."), "Document Type" = FIELD("Document Type"), "Document Line No." = FIELD("Document Line No.");
                ApplicationArea = All;
            }
            group(Costing)
            {
                Caption = 'Costing';
                field("Components Cost"; "Components Cost")
                {
                }
                field("Manufacturing Cost"; "Manufacturing Cost")
                {
                }
                field("Resource Cost"; "Resource Cost")
                {
                }
                field("Development Time in hours"; "Development Time in hours")
                {
                }
                field("Development Cost per hour"; "Development Cost per hour")
                {
                }
                field("Development Cost"; "Development Cost")
                {
                }
                field("Installation Cost"; "Installation Cost")
                {
                }
                field("Additional Cost"; "Additional Cost")
                {
                }
                field("Total Cost"; "Total Cost")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        SalesLine: Record "Sales Line";
        ManufacturingSetup: Record "Manufacturing Setup";
        TenderLine: Record "Tender Line";

    procedure CalculateTotalCost();
    begin
    end;
}

