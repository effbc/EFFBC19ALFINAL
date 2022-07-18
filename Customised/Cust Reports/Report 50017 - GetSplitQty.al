report 50017 "Get Split Qty"
{
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    label("Enter the Qty. to Split")
                    {
                        Caption = 'Enter the Qty. to Split';
                    }
                    field(InputQty; InputQty)
                    {
                        ShowCaption = false;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        InputQty: Decimal;


    procedure SetQTY(var ReqQty: Decimal)
    begin
        ReqQty := InputQty;
    end;
}

