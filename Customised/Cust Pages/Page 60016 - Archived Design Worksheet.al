page 60016 "Archived Design Worksheet"
{
    // version B2B1.0

    Editable = false;
    PageType = Document;
    SourceTable = "Archived DesignWorksheet";

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
            }
            part(DesignWorksheetLines; "Archived Designsheet Subform")
            {
                SubPageLink = "Document No." = FIELD("Document No."), "Document Type" = FIELD("Document Type"), "Document Line No." = FIELD("Document Line No."), "Version No." = FIELD("Version No.");
            }
            group(Costings)
            {
                Caption = 'Costings';
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
                field("Development cost per hour"; "Development cost per hour")
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
            group(Version)
            {
                Caption = 'Version';

                field("Main Item Manu Cost"; "Main Item Manu Cost")
                {
                }
                field("Total Manu Cost"; "Total Manu Cost")
                {
                }
                field("Archived By."; "Archived By.")
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

