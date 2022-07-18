page 50031 "Product Groups Cust"
{
    Caption = 'Product Groups';
    DataCaptionFields = "Item Category Code";
    PageType = List;
    SourceTable = "Product Group Cust";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Item Category Code"; "Item Category Code")
                {
                }
                field("Code"; Code)
                {
                }
                field("Warehouse Class Code"; "Warehouse Class Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

