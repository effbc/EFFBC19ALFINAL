page 90001 "Design Worksheet Summary"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "Design Worksheet Summary";

    layout
    {
        area(content)
        {
            field("Material Direct Cost"; "Material Direct Cost")
            {
                Caption = 'Material Cost';
            }
            field("Labour Direct Cost"; "Labour Direct Cost")
            {
                Caption = 'Labour Cost';
            }
            field("Other Direct Cost"; "Other Direct Cost")
            {
                Caption = 'Other Cost';
            }
            field("Totals Direct Cost"; "Totals Direct Cost")
            {
            }
            field("Material Indirect Cost"; "Material Indirect Cost")
            {
                Caption = 'Material Cost';
            }
            field("Labour Indirect Cost"; "Labour Indirect Cost")
            {
                Caption = 'Labour Cost';
            }
            field("Other Indirect Cost"; "Other Indirect Cost")
            {
                Caption = 'Other Cost';
            }
            field("Total Indirect Cost"; "Total Indirect Cost")
            {
                Caption = 'Total Indirect Cost';
            }
            label(Control1102152028)
            {
                CaptionClass = Text19062819;
                ShowCaption = false;
                Style = Standard;
                StyleExpr = TRUE;
            }
            label(Control1102152012)
            {
                CaptionClass = Text19039083;
                ShowCaption = false;
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
    }

    var
        Text19039083: Label 'InDirect Cost';
        Text19062819: Label 'Profit %';
}

