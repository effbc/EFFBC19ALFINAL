page 50030 "RPOs List"
{
    PageType = List;
    SourceTable = "Production Order";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Source No."; "Source No.")
                {
                    Editable = false;
                }
                field(Quantity; Quantity)
                {
                    Editable = false;
                }
                field("Sales Order No."; "Sales Order No.")
                {
                    Editable = false;
                }
                field("Sales Order Line No."; "Sales Order Line No.")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Prod Start date"; "Prod Start date")
                {
                }
                field("Suppose to Plan"; "Suppose to Plan")
                {
                }
                field("Planned Dispatch Date"; "Planned Dispatch Date")
                {
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                    Editable = false;
                }
                field(Itm_Card_ttl_units; Itm_Card_ttl_units)
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

