pageextension 70303 ProductionBOMLinesExt extends "Production BOM Lines"
{
    layout
    {
        modify("No.")
        {
            trigger OnBeforeValidate()
            begin
                BOMLine.RESET;
                BOMLine.SETFILTER(BOMLine."Production BOM No.", Rec."Production BOM No.");
                BOMLine.SETFILTER(BOMLine."No.", Rec."No.");
                BOMLine.SETFILTER(BOMLine."Line No.", '<>%1', Rec."Line No.");
                IF BOMLine.FINDFIRST THEN BEGIN
                    ERROR('Item already exits in line no %1', BOMLine."Line No.");
                END;


                IF (Rec.Type = Rec.Type::"Production BOM") THEN BEGIN
                    ProductionBOMHeader.GET(Rec."No.");
                    ProductionBOMHeader.TESTFIELD("BOM Type");
                    Rec."BOM Type" := ProductionBOMHeader."BOM Type";
                END;
            end;
        }
        addfirst(content)
        {
            field(COUNT; Rec.COUNT)
            {

            }
        }
        addafter(Type)
        {
            field("Line No."; Rec."Line No.")
            {

            }
        }
        addafter("Variant Code")
        {
            field("Material Reqired Day"; Rec."Material Reqired Day")
            {

            }
        }
        addafter("Quantity per")
        {
            field("No. of Opportunities"; Rec."No. of Opportunities")
            {

            }
            field("Part number"; Rec."Part number")
            {

            }
            field(Package; Rec.Package)
            {

            }
            field("Storage Temperature"; Rec."Storage Temperature")
            {

            }
            field(Make; Rec.Make)
            {

            }
            field("Description 2"; Rec."Description 2")
            {
                Editable = false;
            }
            field("Scrap Quantity"; Rec."Scrap Quantity")
            {

            }
            field("No. of Pins"; Rec."No. of Pins")
            {
                Visible = "No. of PinsVisible";
                Editable = "No. of PinsEditable";
            }
            field("No. of SMD Points"; Rec."No. of SMD Points")
            {
                Visible = "No. of SMD PointsVisible";
            }
            field("No. of DIP Point"; Rec."No. of DIP Point")
            {
                Visible = "No. of DIP PointVisible";
            }
            field("No. of Soldering Points"; Rec."No. of Soldering Points")
            {
                Editable = NoofSolderingPointsEditable;
            }
            field("No. of Fixing Holes"; Rec."No. of Fixing Holes")
            {

            }
            field("Type of Solder"; Rec."Type of Solder")
            {
                Visible = "Type of SolderVisible";
                Editable = "Type of SolderEditable";
            }
            field("Avg Cost"; Rec."Avg Cost")
            {

            }
        }
        addafter("Ending Date")
        {
            field("Position 4"; Rec."Position 4")
            {

            }
            field("BOM Type"; Rec."BOM Type")
            {
                Editable = true;
            }
            field("Version Code"; Rec."Version Code")
            {

            }
            field("Operation No."; Rec."Operation No.")
            {

            }
            field(Dept; Rec.Dept)
            {

            }
            field("operating temp"; Rec."operating temp")
            {
                Caption = 'Operating Temperature';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord()
    begin
        IF FORMAT(Rec.Type) = ' ' THEN BEGIN
            DescriptionEditable := TRUE;
            "No. of PinsEditable" := TRUE;
            NoofSolderingPointsEditable := TRUE;
            "Type of SolderEditable" := TRUE;
        END ELSE BEGIN
            DescriptionEditable := FALSE;
            "No. of PinsEditable" := FALSE;
            NoofSolderingPointsEditable := FALSE;
            "Type of SolderEditable" := FALSE;
        END;
    end;

    var
        BOMLine: Record "Production BOM Line";
        DescriptionEditable: Boolean;
        "No. of PinsEditable": Boolean;
        NoofSolderingPointsEditable: Boolean;
        "Type of SolderEditable": Boolean;
        "No. of SMD PointsVisible": Boolean;
        "No. of DIP PointVisible": Boolean;
        "No. of PinsVisible": Boolean;
        "Type of SolderVisible": Boolean;
        ProductionBOMHeader: Record "Production BOM Header";

    PROCEDURE Showform(Show: Boolean);
    BEGIN
        IF Show THEN BEGIN
            "No. of SMD PointsVisible" := TRUE;
            "No. of DIP PointVisible" := TRUE;
            "No. of PinsVisible" := FALSE;
            "Type of SolderVisible" := FALSE;
        END ELSE BEGIN
            "No. of SMD PointsVisible" := FALSE;
            "No. of DIP PointVisible" := FALSE;
            "No. of PinsVisible" := TRUE;
            "Type of SolderVisible" := TRUE;
        END;
    END;
}