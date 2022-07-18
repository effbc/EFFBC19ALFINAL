tableextension 70117 PurchasePriceExt extends "Purchase Price"
{

    fields
    {
        field(50011; "Variant Code1"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Maximum Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50002; Make; Code[30])
        {
            TableRelation = Make;
            DataClassification = CustomerContent;
        }
        field(50003; "Part Number"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(50004; Remarks; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50005; SPQ; Decimal)
        {
            Description = 'Standard Package Quantity';
            DataClassification = CustomerContent;
        }
        field(50006; "Unit Cost with Charges"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Dollar Cost"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50008; Attachment; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Lead Time"; DateFormula)
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Quotation Type"; Enum QuotationType)
        {
            DataClassification = CustomerContent;

        }
    }

}

