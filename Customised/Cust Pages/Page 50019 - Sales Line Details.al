page 50019 "Sales Line Details"
{
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = SORTING("Document Type", "Document No.", "Line No.") ORDER(Ascending) WHERE("Document No." = FILTER('<>EFF/AMC/*'), "Outstanding Quantity" = FILTER(> 0), MainCategory = FILTER('<>Temp-Closed'),
                                  "Sell-to Customer No." = FILTER('<>CUST02007'));

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
            }
            repeater(Group)
            {
                field("Product Group Code Cust"; Rec."Product Group Code Cust")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    DrillDown = false;
                    Editable = false;
                    Lookup = true;
                    LookupPageID = "Sales Order";
                    TableRelation = "Sales Header" WHERE(Status = FILTER(Released), "No." = FIELD("Document No."));
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Editable = false;
                    TableRelation = "Sales Header"."Sell-to Customer Name" WHERE("No." = FIELD("Document No."));
                    Visible = false;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    Editable = false;
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    Visible = false;
                    Width = 1;
                }
                field("Qty. to Invoice"; Rec."Qty. to Invoice")
                {
                    Editable = false;
                    Visible = false;
                    Width = 1;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    Editable = false;
                }
                field(ProductGroup; Rec.ProductGroup)
                {
                    Editable = false;
                }
                field(Vertical; Rec.Vertical)
                {
                    Editable = true;
                }
                field("RDSO Inspection Required"; Rec."RDSO Inspection Required")
                {
                }
                field(MainCategory; Rec.MainCategory)
                {
                }
                field("Reg/Non reg Product"; Rec."Reg/Non reg Product")
                {

                }
                field(SubCategory; Rec.SubCategory)
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Call Letter Status"; Rec."Call Letter Status")
                {
                }
                field("Call Letter Exp Date"; Rec."Call Letter Exp Date")
                {
                    Caption = 'Customer Expected Date';
                }
                field("Prod Start Date"; Rec."Prod Start Date")
                {
                }
                field("Dispatch Date"; Rec."Dispatch Date")
                {
                }
                field("Deviated Dispatch Date"; Rec."Deviated Dispatch Date")
                {
                }
                field("RDSO Number"; Rec."RDSO Number")
                {
                }
                field("Tentative RDSO Date"; Rec."Tentative RDSO Date")
                {
                }
                field("CL_CNSGN  rcvd Date1"; Rec."CL_CNSGN  rcvd Date1")
                {
                }
                field("CL_CNSGN  rcvd Qty"; Rec."CL_CNSGN  rcvd Qty")
                {
                }
                field("Production Stage"; Rec."Production Stage")
                {
                }
                field("Product ready Date Committed"; Rec."Product ready Date Committed")
                {
                }
                field("Product ready Date (Revised)"; Rec."Product ready Date (Revised)")
                {
                }
                field(Priority; Rec.Priority)
                {

                }
                field("Non Regular Stages"; Rec."Non Regular Stages")
                {

                }
                field("Responsible Dept"; Rec."Responsible Dept")
                {

                }
                field("M Stage"; Rec."M Stage")
                {

                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        /*CUS.RESET;
        CUS.SETFILTER("No.",Rec."Sell-to Customer No.");
        IF CUS.FINDSET THEN
          BEGIN
            Rec."Sell-to Customer Name" := CUS.Name;
            Rec.MODIFY;
            END;*/

        CUS.RESET;
        CUS.SETFILTER("No.", Rec."Sell-to Customer No.");
        IF CUS.FINDSET THEN BEGIN
            Rec."Sell-to Customer Name" := CUS.Name;
            IF Rec."RDSO Inspection Required" = TRUE THEN BEGIN
                SH.RESET;
                SH.SETFILTER("No.", Rec."Document No.");
                IF SH.FINDFIRST THEN
                    Rec."Call Letter Status" := SH."Call letters Status";
            END;
            Rec.MODIFY;
        END;


        /*SH.RESET;
        SH.SETFILTER("No.","Document No.");
        IF SH.FINDSET THEN
          REPEAT
            BEGIN
            "Call Letter Status1" := FORMAT(SH."Call letters Status");
            END;
          UNTIL SH.NEXT = 0;
          */

    end;

    trigger OnOpenPage();
    begin
        IF NOT ("Custom Events".Permission_Checking(USERID, 'SALES_LINE_DETAILS'))
          THEN
            ERROR('You Don"t have Permissions');

        SH.RESET;
        SH.SETFILTER("No.", Rec."Document No.");
        SH.SETFILTER(Status, 'Released');
        SH.SETFILTER("Order Status", '<>%1', 9);
        Rec.SETFILTER(Type, FORMAT(Rec.Type::Item));
        // Rec.SETFILTER("Product Group Code ", '<> %1', '');
        //Rec.SETFILTER("Document Type",'%1|%2',Rec."Document Type"::Order,Rec."Document Type"::"Blanket Order");
        Rec.SETFILTER("Document Type", '%1', Rec."Document Type"::Order);
    end;

    var
        // SMTP_MAIL: Codeunit "SMTP Mail";
        "Custom Events": Codeunit "Custom Events";
        SH: Record "Sales Header";
        "Order Release Date": Date;
        CUS: Record Customer;
        "Call Letter Status1": Code[10];
        SAL_ORDER_NO: Code[30];
}

