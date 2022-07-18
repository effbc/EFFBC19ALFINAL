page 60229 "Led Order Subform"
{
    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.

    AutoSplitKey = true;
    Caption = 'Sales Order Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    Permissions = TableData "Dimension Set Entry" = rimd;
    SaveValues = true;
    SourceTable = "Sales Line";
    SourceTableView = WHERE("Document Type" = FILTER(Order));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        TypeOnAfterValidate;
                    end;
                }
                field("Schedule Type"; "Schedule Type")
                {
                    Visible = false;
                }
                field("Line No."; "Line No.")
                {
                }
                field("No."; "No.")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                         item.RESET;
                         //item.SETFILTER(item."Product Group Code",'FPRODUCT');
                         //item.SETFILTER(item."Item Sub Group Code",'%1|%2','LED LIGHT','IDLC');
                        */  // Commented by Rakesh
                        IF Type = Type::Item THEN BEGIN
                            item.RESET;
                            item.SETFILTER(item."Item Status", '<>In-Active');
                            item.SETFILTER(item.Blocked, 'NO');
                            IF PAGE.RUNMODAL(31, item) = ACTION::LookupOK THEN
                                VALIDATE("No.", item."No.");
                        END                      // copied code by Rakesh on 19-Nov-14
                        ELSE
                            IF Type = Type::"G/L Account" THEN BEGIN
                                GLAccount.RESET;
                                IF PAGE.RUNMODAL(18, GLAccount) = ACTION::LookupOK THEN
                                    VALIDATE("No.", GLAccount."No.");
                            END;                      // copied code by Rakesh on 19-Nov-14

                    end;

                    trigger OnValidate()
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        "Location Code" := 'PROD';
                        MODIFY;
                        NoOnAfterValidate;
                    end;
                }
                field(Description; Description)
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {

                    trigger OnValidate()
                    begin
                        UnitofMeasureCodeC44OnAfterVal;
                    end;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    Visible = false;
                }
                field("Unit Price"; "Unit Price")
                {
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;

                    trigger OnValidate()
                    begin
                        QuantityOnAfterValidate;
                        IF Quantity < "Quantity Shipped" THEN
                            ERROR('Qty must not be less than Quantity Shipped!');
                    end;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                }
                /* field("Tax %"; "Tax %")
                {
                    Editable = false;
                } */ //B2BUPG
                field("Posting Group"; "Posting Group")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Schedule No"; "Schedule No")
                {
                    Visible = false;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Visible = false;
                }
                /* field("Excise Accounting Type"; "Excise Accounting Type")
                {
                    Visible = false;
                } */ //B2BUPG
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                }
                field("RDSO Inspection Required"; "RDSO Inspection Required")
                {
                    Visible = false;
                }
                field("Cross-Reference No."; "Cross-Reference No.")
                {
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CrossReferenceNoLookUp;
                        InsertExtendedText(FALSE);
                    end;

                    trigger OnValidate()
                    begin
                        CrossReferenceNoOnAfterValidat;
                    end;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    Visible = false;
                }
                /* field("Service Tax Group"; "Service Tax Group")
                {
                    Visible = false;
                } */ //B2BUPG
                field("VAT %"; "VAT %")
                {
                }
                /* field("Claim Deferred Excise"; "Claim Deferred Excise")
                {
                    Visible = false;
                }
                field("Direct Debit To PLA / RG"; "Direct Debit To PLA / RG")
                {
                    Visible = false;
                }
                field("Service Tax Registration No."; "Service Tax Registration No.")
                {
                    Visible = false;
                } */ //B2BUPG
                field("IC Partner Ref. Type"; "IC Partner Ref. Type")
                {
                    Visible = false;
                }
                field("IC Partner Reference"; "IC Partner Reference")
                {
                    Visible = false;
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field("Substitution Available"; "Substitution Available")
                {
                    Visible = false;
                }
                field("Purchasing Code"; "Purchasing Code")
                {
                    Visible = false;
                }
                field(Nonstock; Nonstock)
                {
                    Visible = false;
                }
                field("Drop Shipment"; "Drop Shipment")
                {
                    Visible = false;
                }
                /* //B2BUPG
                field(MRP; MRP)
                {
                    Editable = true;
                    Visible = false;
                }
                field("MRP Price"; "MRP Price")
                {
                    Visible = false;
                }
                field("Abatement %"; "Abatement %")
                {
                    Visible = false;
                }
                field("PIT Structure"; "PIT Structure")
                {
                    Visible = false;
                }
                */
                field("Price Inclusive of Tax"; "Price Inclusive of Tax")
                {
                    Visible = false;
                }
                field("Unit Price Incl. of Tax"; "Unit Price Incl. of Tax")
                {
                    Visible = false;
                }
                field("Special Order"; "Special Order")
                {
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {

                    trigger OnValidate()
                    begin
                        LocationCodeC42OnAfterValidate;
                    end;
                }
                field("Bin Code"; "Bin Code")
                {
                    Visible = false;
                }
                field(Reserve; Reserve)
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        ReserveOnAfterValidate;
                    end;
                }
                field("Purchase Order No."; "Purchase Order No.")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field(SalesPriceExist; PriceExists)
                {
                    Caption = 'Sales Price Exists';
                    Editable = false;
                    Visible = false;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;

                    trigger OnValidate()
                    begin
                        TESTFIELD("Price Inclusive of Tax", FALSE);
                    end;
                }
                field(SalesLineDiscExists; LineDiscExists)
                {
                    Caption = 'Sales Line Disc. Exists';
                    Editable = false;
                    Visible = false;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
                field("Prepayment %"; "Prepayment %")
                {
                    Visible = false;
                }
                field("Prepmt. Line Amount"; "Prepmt. Line Amount")
                {
                    Visible = false;
                }
                field("Prepmt. Amt. Inv."; "Prepmt. Amt. Inv.")
                {
                    Visible = false;
                }
                /* //B2BUPG
                field("Assessable Value";"Assessable Value")
                {
                    Visible = false;
                }
                field("CIF Amount";"CIF Amount")
                {
                    Visible = false;
                }
                field("BCD Amount";"BCD Amount")
                {
                    Visible = false;
                }
                field("BED Amount";"BED Amount")
                {
                    Visible = false;
                }
                field("AED(GSI) Amount";"AED(GSI) Amount")
                {
                    Visible = false;
                }
                field("AED(TTA) Amount";"AED(TTA) Amount")
                {
                    Visible = false;
                }
                field("SED Amount";"SED Amount")
                {
                    Visible = false;
                }
                field("SAED Amount";"SAED Amount")
                {
                    Visible = false;
                }
                field("CESS Amount";"CESS Amount")
                {
                    Visible = false;
                }
                field("NCCD Amount";"NCCD Amount")
                {
                    Visible = false;
                }
                field("ADE Amount";"ADE Amount")
                {
                    Visible = false;
                }
                field("ADET Amount";"ADET Amount")
                {
                    Visible = false;
                }
                field("eCess Amount";"eCess Amount")
                {
                    Visible = false;
                }
                field("SHE Cess Amount";"SHE Cess Amount")
                {
                    Visible = false;
                }
                field("ADC VAT Amount";"ADC VAT Amount")
                {
                    Visible = false;
                }
                field(Supplementary;Supplementary)
                {
                    Visible = false;
                }
                field("Source Document Type";"Source Document Type")
                {
                    Visible = false;
                }
                field("Source Document No.";"Source Document No.")
                {
                    Visible = false;
                }
                */
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Inv. Discount Amount"; "Inv. Discount Amount")
                {
                    Visible = false;
                }
                field("Qty. to Ship"; "Qty. to Ship")
                {
                    BlankZero = true;
                }
                field("Quantity Shipped"; "Quantity Shipped")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Qty. to Invoice"; "Qty. to Invoice")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Prepmt Amt to Deduct"; "Prepmt Amt to Deduct")
                {
                    Visible = false;
                }
                field("Prepmt Amt Deducted"; "Prepmt Amt Deducted")
                {
                    Visible = false;
                }
                field("Allow Item Charge Assignment"; "Allow Item Charge Assignment")
                {
                    Visible = false;
                }
                field("Qty. to Assign"; "Qty. to Assign")
                {
                    BlankZero = true;

                    trigger OnDrillDown()
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Qty. Assigned"; "Qty. Assigned")
                {
                    BlankZero = true;

                    trigger OnDrillDown()
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    Visible = false;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    Visible = false;
                }
                field("Planned Delivery Date"; "Planned Delivery Date")
                {
                }
                field("Planned Shipment Date"; "Planned Shipment Date")
                {
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    Visible = false;
                }
                field("Shipping Time"; "Shipping Time")
                {
                    Visible = false;
                }
                field("Work Type Code"; "Work Type Code")
                {
                    Visible = false;
                }
                field("Whse. Outstanding Qty. (Base)"; "Whse. Outstanding Qty. (Base)")
                {
                    Visible = false;
                }
                field("Outbound Whse. Handling Time"; "Outbound Whse. Handling Time")
                {
                    Visible = false;
                }
                field("Blanket Order No."; "Blanket Order No.")
                {
                    Visible = false;
                }
                field("Blanket Order Line No."; "Blanket Order Line No.")
                {
                    Visible = false;
                }
                field("FA Posting Date"; "FA Posting Date")
                {
                    Visible = false;
                }
                field("Depr. until FA Posting Date"; "Depr. until FA Posting Date")
                {
                    Visible = false;
                }
                field("Depreciation Book Code"; "Depreciation Book Code")
                {
                    Visible = false;
                }
                field("Use Duplication List"; "Use Duplication List")
                {
                    Visible = false;
                }
                field("Duplicate in Depreciation Book"; "Duplicate in Depreciation Book")
                {
                    Visible = false;
                }
                field("Appl.-from Item Entry"; "Appl.-from Item Entry")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                /* field("Process Carried Out"; "Process Carried Out")
                {
                    Visible = "Process Carried OutVisible";
                } */ //B2BUPG
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Qty. Shipped Not Invoiced"; "Qty. Shipped Not Invoiced")
                {
                    Editable = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
                field("Outstanding Quantity"; "Outstanding Quantity")
                {
                }
                field("Unitcost(LOA)"; "Unitcost(LOA)")
                {

                    trigger OnValidate()
                    begin
                        IF "Quantity Invoiced" > 0 THEN
                            ERROR('You cannot change the unit cost loa after the item is invoiced!');
                    end;
                }
                field("OutStanding(LOA)"; "OutStanding(LOA)")
                {
                }
                field("Line Amount(LOA)"; "Line Amount(LOA)")
                {
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("Retention Portion"; "Retention Portion")
                {
                    Visible = false;
                }
                field("Supply Portion"; "Supply Portion")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        "Retention Portion" := 100 - "Supply Portion";
                    end;
                }
                field("Material Reuired Date"; "Material Reuired Date")
                {
                    Visible = false;
                }
                field("Type of Item"; "Type of Item")
                {
                    Visible = false;
                }
                field("Dummy Unit Cost"; "Dummy Unit Cost")
                {
                    Visible = false;
                }
                field("RDSO Charges"; "RDSO Charges")
                {
                    Visible = false;
                }
                field("To Be Shipped Qty"; "To Be Shipped Qty")
                {
                }
                field("Packet No"; "Packet No")
                {
                    Visible = false;
                }
                field("Description 2"; "Description 2")
                {
                }
                /* field("Service Tax Amount"; "Service Tax Amount")
                {
                } */ //B2BUPG
                field("Outstanding Amount"; "Outstanding Amount")
                {
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                /* field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
                {
                }
                field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
                {
                } */ //B2BUPG
                field("Unit of Measure"; "Unit of Measure")
                {
                    Visible = false;
                }
                field("Prod. Order Quantity"; "Prod. Order Quantity")
                {
                    Visible = false;
                }
                field("Prod. Due Date"; "Prod. Due Date")
                {
                    Visible = false;
                }
                field("Prod. Qty"; "Prod. Qty")
                {
                    Visible = false;
                }
                field("Production BOM No."; "Production BOM No.")
                {
                    Visible = false;
                }
                field("Pending By"; "Pending By")
                {
                }
                field("Amount To Customer"; "Amount To Customer")
                {
                }
                field("GST Place of Supply"; "GST Place of Supply")
                {
                }
                field("GST Group Code"; "GST Group Code")
                {
                }
                field("GST Group Type"; "GST Group Type")
                {
                }
                /* field("GST Base Amount"; "GST Base Amount")
                 {
                 }*/
                /* field("GST %"; "GST %")
                 {
                 }*/
                /* field("Total GST Amount"; "Total GST Amount")
                 {
                 }*/
                field("HSN/SAC Code"; "HSN/SAC Code")
                {
                }
                field("GST Jurisdiction Type"; "GST Jurisdiction Type")
                {
                }
                field(Exempted; Exempted)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    action(Period)
                    {
                        Caption = 'Period';

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            _ItemAvailability(0);

                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            _ItemAvailability(1);

                        end;
                    }
                    action(Location)
                    {
                        Caption = 'Location';

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            _ItemAvailability(2);

                        end;
                    }
                }
                action("Reservation Entries")
                {
                    Caption = 'Reservation Entries';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowReservationEntries;

                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _OpenItemTrackingLines;

                    end;
                }
                action("Select Item Substitution")
                {
                    Caption = 'Select Item Substitution';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowItemSub;

                    end;
                }
                action("Packing Details")
                {
                    Caption = 'Packing Details';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPackingDetails;

                    end;
                }
                action("Delivery &Challan")
                {
                    Caption = 'Delivery &Challan';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowDeliveryChallan;

                    end;
                }
                action("&Line Attachments")
                {
                    Caption = '&Line Attachments';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        SalesLineAttachments;

                    end;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowDimensions;

                    end;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowLineComments;

                    end;
                }
                action("Item Charge &Assignment")
                {
                    Caption = 'Item Charge &Assignment';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ItemChargeAssgnt;

                    end;
                }
                action("Order &Promising")
                {
                    Caption = 'Order &Promising';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _OrderPromisingLine;

                    end;
                }
                action("Str&ucture Details")
                {
                    Caption = 'Str&ucture Details';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        //ShowStrDetailsForm;

                    end;
                }
                action(Structure)
                {
                    Caption = 'Structure';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowStrOrderDetailsPITForm;

                    end;
                }
                action("Excise Detail")
                {
                    Caption = 'Excise Detail';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowExcisePostingSetup;

                    end;
                }
                action("Detailed Tax")
                {
                    Caption = 'Detailed Tax';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        //ShowDetailedTaxEntryBuffer;

                    end;
                }
                action("Design Worksheet")
                {
                    Caption = 'Design Worksheet';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSalesOrderWorkSheet;

                    end;
                }
                action("Sc&hedule")
                {
                    Caption = 'Sc&hedule';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSchedule;

                    end;
                }
                action("Prod. Order Details")
                {
                    Caption = 'Prod. Order Details';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPODetails;

                    end;
                }
                action("CreateProd.Order")
                {
                    Caption = 'Create Prod. Order';

                    trigger OnAction()
                    var
                        NewStatus2: Option Simulated,Planned,"Firm Planned",Released;
                        NewOrderType2: Option ItemOrder,ProjectOrder;
                    begin
                        /*SalesPlanForm.SetSalesOrder("No.");
                        SalesPlanForm.RUNMODAL;
                        */

                        //IF CreateOrderForm.RUNMODAL <> ACTION::Yes THEN
                        //EXIT;
                        IF FORMAT("Pending By") <> ' ' THEN             //Added By Pranavi on 23-09-2015 to restrict create RPO if item is Pending by
                            ERROR('You Can not Create Production order for Item: ' + "No." + '--' + Description + '\ As it Pending By ' + FORMAT("Pending By"));
                        SalesPlanLine.DELETEALL;
                        //Quantity := MakeLines(SalesLineRec);
                        ProdMakeQty := MakeLines(SalesLineRec);        //Added by Pranavi on 13-10-215 for quantity correction
                        NewStatus2 := NewStatus2::Released;
                        NewOrderType2 := NewOrderType2::ItemOrder;
                        //CreateOrderForm.ReturnPostingInfo(NewStatus2,NewOrderType2);
                        /*IF ("sales header"."Document Type"="sales header"."Document Type"::Order)THEN
                        BEGIN
                        //MESSAGE('hai');
                          IF "Order Assurance"=FALSE THEN
                             ERROR('Order Was not Assured By Sales Dept.');
                        //end ELSE
                        //BEGIN
                          MESSAGE(FORMAT(Quantity));
                          FOR I := 1 TO Quantity
                          DO BEGIN
                           // MESSAGE('hi');
                            Qty := 1;
                            CreateOrders(Qty);
                          END;
                        END;*/
                        Saleshdr.RESET;
                        Saleshdr.SETFILTER(Saleshdr."Document Type", '%1', Saleshdr."Document Type"::Order);
                        Saleshdr.SETFILTER(Saleshdr."No.", "Document No.");
                        IF Saleshdr.FINDFIRST THEN
                            IF Saleshdr."Order Assurance" = FALSE THEN
                                ERROR('Order Was not Assured By Sales Dept.')
                            ELSE BEGIN
                                FOR I := 1 TO ProdMakeQty
                                  DO BEGIN
                                    Qty := 1;
                                    CreateOrders(Qty);
                                END;
                            END;
                        "Prod. Qty" := 0;
                        //IF NOT CreateOrders THEN
                        //MESSAGE(Text001);

                        //SalesPlanLine.SETRANGE("Planning Status");

                        //BuildForm;

                        //CurrForm.UPDATE;

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Get Price")
                {
                    Caption = 'Get Price';
                    Ellipsis = true;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPrices

                    end;
                }
                action("Get Li&ne Discount")
                {
                    Caption = 'Get Li&ne Discount';
                    Ellipsis = true;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowLineDisc

                    end;
                }
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ExplodeBOM;

                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _InsertExtendedText(TRUE);

                    end;
                }
                action("&Reserve")
                {
                    Caption = '&Reserve';
                    Ellipsis = true;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowReservation;

                    end;
                }
                action("Order &Tracking")
                {
                    Caption = 'Order &Tracking';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowTracking;

                    end;
                }
                action("Nonstoc&k Items")
                {
                    Caption = 'Nonstoc&k Items';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowNonstockItems;

                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        CustAttachments;

                    end;
                }
                action("Pre Site Visit")
                {
                    Caption = 'Pre Site Visit';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _Presite;

                    end;
                }
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    action("Purchase &Order")
                    {
                        Caption = 'Purchase &Order';

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            OpenPurchOrderForm;

                        end;
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    action(Action1903192904)
                    {
                        Caption = 'Purchase &Order';

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #60228. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            OpenSpecialPurchOrderForm;

                        end;
                    }
                }
            }
            action("Sales Line &Discounts")
            {
                Caption = 'Sales Line &Discounts';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ShowLineDisc;
                    CurrPage.UPDATE;
                end;
            }
            action("&Sales Prices")
            {
                Caption = '&Sales Prices';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ShowPrices;
                    CurrPage.UPDATE;
                end;
            }
            action("Substitutio&ns")
            {
                Caption = 'Substitutio&ns';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ShowItemSub;
                    CurrPage.UPDATE;
                end;
            }
            action("Availa&bility")
            {
                Caption = 'Availa&bility';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //OutstandingInvoiceAmountFromShipment(0); //B2b1.0
                    CurrPage.UPDATE(TRUE);
                end;
            }
            action("Ite&m Card")
            {
                Caption = 'Ite&m Card';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SalesInfoPaneMgt.LookupItem(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
    begin
        // Added by pranavi on 12-09-2016 for not allowing to delete if outstanding qty > 0 after partially billed
        IF (Quantity <> "Quantity Shipped") AND ("Quantity Shipped" > 0) THEN
            ERROR('You cannot delete the line as there is outstanding qty!');
        // end by pranavi

        IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
            COMMIT;
            IF NOT ReserveSalesLine.DeleteLineConfirm(Rec) THEN
                EXIT(FALSE);
            ReserveSalesLine.DeleteLine(Rec);
        END;
    end;

    trigger OnInit()
    begin
        "Process Carried OutVisible" := TRUE;
        ItemPanelVisible := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Location Code" := 'PROD';
        SalesHeader.RESET;
        SalesHeader.SETFILTER("No.", "Document No.");
        //DIM1.0 Start
        //Code Commented
        /*
        IF SalesHeader.FINDFIRST THEN
        BEGIN
          DD.RESET;
          DD.SETFILTER(DD."Table ID",'%1',36);
          DD.SETFILTER(DD."Document No.",SalesHeader."No.");
          DD.SETFILTER(DD."Dimension Code",'DEPARTMENTS');
          IF NOT DD.FINDFIRST THEN
          BEGIN
            DD.INIT;
            DD."Table ID":=36;
            DD."Document Type":=DD."Document Type"::"1";
            DD."Dimension Code":='DEPARTMENTS';
            DD."Document No.":=SalesHeader."No.";
            DD."Dimension Value Code":='PRD-0010';
            DD.INSERT;
            SalesHeader.VALIDATE(SalesHeader."Shortcut Dimension 1 Code",'PRD-0010');
            SalesHeader.MODIFY;
          END;
        END;
        */

        IF SalesHeader.FINDFIRST THEN BEGIN
            DimSetEntryGRec.RESET;
            DimSetEntryGRec.SETRANGE("Dimension Set ID", SalesHeader."Dimension Set ID");
            DimSetEntryGRec.SETRANGE("Dimension Code", 'DEPARTMENTS');
            IF NOT DimSetEntryGRec.FINDFIRST THEN BEGIN
                DimSetEntryGRec.INIT;
                IF DimSetEntryGRec2.FINDLAST THEN
                    DimSetEntryGRec."Dimension Set ID" := DimSetEntryGRec2."Dimension Set ID" + 1
                ELSE
                    DimSetEntryGRec."Dimension Set ID" := 1;

                DimSetEntryGRec."Dimension Code" := 'DEPARTMENTS';
                DimSetEntryGRec."Dimension Value Code" := 'PRD-0010';
                DimSetEntryGRec.INSERT;
                SalesHeader.VALIDATE(SalesHeader."Shortcut Dimension 1 Code", 'PRD-0010');
                SalesHeader.MODIFY;
            END;
        END;
        //DIM1.0 End
        // added by pranavi on 01-sep-2016 for payment terms
        IF "Document Type" = "Document Type"::Order THEN BEGIN
            SalesHeader.RESET;
            SalesHeader.SETRANGE(SalesHeader."No.", "Document No.");
            IF SalesHeader.FINDFIRST THEN
                IF SalesHeader."Customer Posting Group" IN ['PRIVATE', 'OTHERS'] THEN
                    IF Type = Type::Item THEN BEGIN
                        "Supply Portion" := 100;
                        "Retention Portion" := 0;
                    END ELSE BEGIN
                        "Supply Portion" := 0;
                        "Retention Portion" := 100;
                    END;
        END;
        // end by pranavi

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //Type := xRec.Type;
        Type := Type::Item;
        CLEAR(ShortcutDimCode);
        //"Location Code":='PROD';
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesPriceCalcMgt: Codeunit "Sales Price Calc. Mgt.";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        SalesInfoPaneMgt: Codeunit "Sales Info-Pane Management";
        ShortcutDimCode: array[8] of Code[20];
        Text001: Label 'You can not use the Explode BOM function because a prepayment of the sales order has been invoiced.';
        SalesPlanLine: Record "Sales Planning Line";
        item: Record Item;
        [InDataSet]
        ItemPanelVisible: Boolean;
        [InDataSet]
        "Process Carried OutVisible": Boolean;
        "---Nav2013---": Integer;
        DimSetEntryGRec: Record "Dimension Set Entry";
        DimSetEntryGRec2: Record "Dimension Set Entry";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        GLAccount: Record "G/L Account";
        ProdMakeQty: Integer;
        SalesLineRec: Record "Sales Line";
        Saleshdr: Record "Sales Header";
        I: Integer;
        Qty: Integer;
        NewOrderType: Option ItemOrder,ProjectOrder;
        NewStatus: Option Simulated,Planned,"Firm Planned",Released;
        Itm: Record Item;


    procedure ApproveCalcInvDisc()
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)", Rec);
    end;


    procedure CalcInvDisc()
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount", Rec);
    end;


    procedure ExplodeBOM()
    begin
        IF "Prepmt. Amt. Inv." <> 0 THEN
            ERROR(Text001);
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM", Rec);
    end;


    procedure OpenPurchOrderForm()
    var
        PurchHeader: Record "Purchase Header";
        PurchOrder: Page "Purchase Order";
    begin
        TESTFIELD("Purchase Order No.");
        PurchHeader.SETRANGE("No.", "Purchase Order No.");
        PurchOrder.SETTABLEVIEW(PurchHeader);
        PurchOrder.EDITABLE := FALSE;
        PurchOrder.RUN;
    end;


    procedure OpenSpecialPurchOrderForm()
    var
        PurchHeader: Record "Purchase Header";
        PurchOrder: Page "Purchase Order";
    begin
        TESTFIELD("Special Order Purchase No.");
        PurchHeader.SETRANGE("No.", "Special Order Purchase No.");
        PurchOrder.SETTABLEVIEW(PurchHeader);
        PurchOrder.EDITABLE := FALSE;
        PurchOrder.RUN;
    end;


    procedure _InsertExtendedText(Unconditionally: Boolean)
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec, Unconditionally) THEN BEGIN
            CurrPage.SAVERECORD;
            TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);
    end;


    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec, Unconditionally) THEN BEGIN
            CurrPage.SAVERECORD;
            TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);
    end;


    procedure _ShowReservation()
    begin
        FIND;
        Rec.ShowReservation;
    end;


    procedure ShowReservation()
    begin
        FIND;
        Rec.ShowReservation;
    end;


    procedure _ItemAvailability(AvailabilityType: Option Date,Variant,Location,Bin)
    begin
        //Rec.ItemAvailability(AvailabilityType); //B2b1.0
    end;


    procedure ItemAvailability(AvailabilityType: Option Date,Variant,Location,Bin)
    begin
        //Rec.ItemAvailability(AvailabilityType); //B2b1.0
    end;


    procedure _ShowReservationEntries()
    begin
        Rec.ShowReservationEntries(TRUE);
    end;


    procedure ShowReservationEntries()
    begin
        Rec.ShowReservationEntries(TRUE);
    end;


    procedure _ShowDimensions()
    begin
        Rec.ShowDimensions;
    end;


    /*procedure ShowDimensions()
    begin
        Rec.ShowDimensions;
    end;*/


    procedure _ShowItemSub()
    begin
        Rec.ShowItemSub;
    end;


    /*procedure ShowItemSub()
    begin
        Rec.ShowItemSub;
    end;*/


    procedure ShowNonstockItems()
    begin
        Rec.ShowNonstock;
    end;


    procedure _OpenItemTrackingLines()
    begin
        Rec.OpenItemTrackingLines;
    end;


    /* procedure OpenItemTrackingLines()
     begin
         Rec.OpenItemTrackingLines;
     end;*/


    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
        TrackingForm.SetSalesLine(Rec);
        TrackingForm.RUNMODAL;
    end;


    procedure ItemChargeAssgnt()
    begin
        Rec.ShowItemChargeAssgnt;
    end;


    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;


    procedure ShowPrices()
    begin
        SalesHeader.GET("Document Type", "Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader, Rec);
    end;


    procedure ShowLineDisc()
    begin
        SalesHeader.GET("Document Type", "Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader, Rec);
    end;


    procedure _OrderPromisingLine()
    var
        OrderPromisingLine: Record "Order Promising Line" temporary;
    begin
        OrderPromisingLine.SETRANGE("Source Type", "Document Type");
        OrderPromisingLine.SETRANGE("Source ID", "Document No.");
        OrderPromisingLine.SETRANGE("Source Line No.", "Line No.");
        PAGE.RUNMODAL(PAGE::"Order Promising Lines", OrderPromisingLine);
    end;


    procedure OrderPromisingLine()
    var
        OrderPromisingLine: Record "Order Promising Line" temporary;
    begin
        OrderPromisingLine.SETRANGE("Source Type", "Document Type");
        OrderPromisingLine.SETRANGE("Source ID", "Document No.");
        OrderPromisingLine.SETRANGE("Source Line No.", "Line No.");
        PAGE.RUNMODAL(PAGE::"Order Promising Lines", OrderPromisingLine);
    end;


    procedure _ShowLineComments()
    begin
        Rec.ShowLineComments;
    end;


    /*procedure ShowLineComments()
    begin
        Rec.ShowLineComments;
    end;*/

    /*procedure ShowStrDetailsForm()
    var
        StrOrderLineDetails: Record "Structure Order Line Details";
        StrOrderLineDetailsForm: Page "Structure Order Line Details";
    begin
        StrOrderLineDetails.RESET;
        StrOrderLineDetails.SETCURRENTKEY("Document Type", "Document No.", Type);
        StrOrderLineDetails.SETRANGE("Document Type", "Document Type");
        StrOrderLineDetails.SETRANGE("Document No.", "Document No.");
        StrOrderLineDetails.SETRANGE(Type, StrOrderLineDetails.Type::Sale);
        StrOrderLineDetails.SETRANGE("Item No.", "No.");
        StrOrderLineDetails.SETRANGE("Line No.", "Line No.");
        StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
        StrOrderLineDetailsForm.RUNMODAL;
    end;*/


    procedure MakeVisibleLineControl()
    begin
        "Process Carried OutVisible" := TRUE;
    end;


    procedure MakeInvisibleLineControl()
    begin
        "Process Carried OutVisible" := FALSE;
    end;


    procedure ShowStrOrderDetailsPITForm()
    begin
        // Rec.ShowStrOrderDetailsPIT; //EFFUPG
    end;


    procedure ShowExcisePostingSetup()
    begin
        //GetExcisePostingSetup; // EFFUPG
    end;


    /* procedure ShowDetailedTaxEntryBuffer()
     var
         DetailedTaxEntryBuffer: Record "Detailed Tax Entry Buffer";
     begin
         DetailedTaxEntryBuffer.RESET;
         DetailedTaxEntryBuffer.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Line No.");
         DetailedTaxEntryBuffer.SETRANGE("Transaction Type", DetailedTaxEntryBuffer."Transaction Type"::Sale);
         DetailedTaxEntryBuffer.SETRANGE("Document Type", "Document Type");
         DetailedTaxEntryBuffer.SETRANGE("Document No.", "Document No.");
         DetailedTaxEntryBuffer.SETRANGE("Line No.", "Line No.");
         PAGE.RUNMODAL(PAGE::"Sale Detailed Tax", DetailedTaxEntryBuffer);
     end;*/


    procedure "---B2B--"()
    begin
    end;


    procedure CustAttachments()
    var
        CustAttach: Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.", Rec."Document No.");
        CustAttach.SETRANGE("Document Type", "Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
    end;


    procedure _Presite()
    var
        PreSiteCheckList: Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.", "Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.", "Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List", PreSiteCheckList);
    end;


    procedure Presite()
    var
        PreSiteCheckList: Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.", "Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.", "Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List", PreSiteCheckList);
    end;


    procedure ShowPackingDetails()
    var
        PackingDetails: Record "Shortage Management Audit Data";
    begin
        /*
        PackingDetails.SETRANGE(Week,PackingDetails.Week :: "0");
        PackingDetails.SETRANGE("Sale Order","Document No.");
        PackingDetails.SETRANGE(Customer,"Line No.");
        Page.RUNMODAL(Page :: "Shortage Mng Audit Data",PackingDetails);
                                                                          */

    end;


    procedure SalesLineAttachments()
    var
        CustAttach: Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.", Rec."Document No.");
        CustAttach.SETRANGE("Document Type", "Document Type"::Order);
        CustAttach.SETRANGE("Document Line No.", "Line No.");

        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
    end;


    procedure ShowSalesOrderWorkSheet()
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        DesignWorksheetLine: Record "Design Worksheet Line";
        Item: Record Item;
        ItemDesignWorksheetHeader: Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine: Record "Item Design Worksheet Line";
    begin
        /*
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
          Page.RUNMODAL(60122,DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
        */
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
            DesignWorksheetHeader.INIT;
            DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
            DesignWorksheetHeader."Document No." := "Document No.";
            DesignWorksheetHeader."Document Line No." := "Line No.";
            DesignWorksheetHeader."Document Type" := DesignWorksheetHeader."Document Type"::Order;
            IF DesignWorksheetHeader.INSERT THEN;
            ItemDesignWorksheetLine.RESET;
            ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No", ItemDesignWorksheetHeader."Item No.");
            IF ItemDesignWorksheetLine.FINDSET THEN
                REPEAT
                    DesignWorksheetLine.INIT;
                    DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
                    DesignWorksheetLine."Document No." := "Document No.";
                    DesignWorksheetLine."Document Line No." := "Line No.";
                    DesignWorksheetLine."Document Type" := DesignWorksheetLine."Document Type"::Order;
                    IF DesignWorksheetLine.INSERT THEN;
                UNTIL ItemDesignWorksheetLine.NEXT = 0;
        END;
        COMMIT;

        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
            PAGE.RUNMODAL(60122, DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;


    procedure ShowDeliveryChallan()
    var
        DeliveryChallan: Record "DC Header";
    begin
        DeliveryChallan.SETRANGE(Status, DeliveryChallan.Status::Open);
        DeliveryChallan.SETRANGE("Sales Order No.", "Document No.");
        //DeliveryChallan.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"DC Header", DeliveryChallan);
    end;


    procedure ShowSchedule2()
    var
        Schedule: Record Schedule2;
    begin
        IF ("Tender No." = '') AND ("Tender Line No." = 0) THEN BEGIN
            Schedule.RESET;
            Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
            Schedule.SETRANGE("Document No.", "Document No.");
            Schedule.SETRANGE("Document Line No.", "Line No.");
            //Schedule.SETRANGE("Item No.","No.");
            //Schedule.SETRANGE(Quantity,Quantity);
            Schedule.FILTERGROUP(2);
            PAGE.RUN(60125, Schedule);
            Schedule.FILTERGROUP(0);
        END ELSE BEGIN
            Schedule.RESET;
            Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
            Schedule.SETRANGE("Document No.", "Tender No.");
            Schedule.SETRANGE("Document Line No.", "Tender Line No.");
            //Schedule.SETRANGE("Item No.","No.");
            //Schedule.SETRANGE(Quantity,Quantity);
            Schedule.FILTERGROUP(2);
            PAGE.RUN(60127, Schedule);
            Schedule.FILTERGROUP(0);
        END;
    end;


    procedure ShowPODetails()
    var
        SOPodetails: Record "SO Prod.Order Details";
    begin
        SOPodetails.SETRANGE("Sales Order No.", "Document No.");
        SOPodetails.SETRANGE("Sales Order Line No.", "Line No.");
        PAGE.RUNMODAL(60126, SOPodetails);
    end;


    procedure MakeLines(var SalesLineparam: Record "Sales Line"): Decimal
    var
        SalesLine: Record "Sales Line";
        ProdOrderLine: Record "Prod. Order Line";
        PurchLine: Record "Purchase Line";
        ReqLine: Record "Requisition Line";
        ReservEntry2: Record "Reservation Entry";
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrder;
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Document No.", "Document No.");
        //NSS 301207
        SalesLine.SETRANGE("Line No.", "Line No.");
        //NSS
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);

        IF SalesLine.FINDFIRST THEN BEGIN
            //REPEAT
            SalesLine.TESTFIELD("Prod. Qty");
            SalesLine.TESTFIELD("Prod. Due Date");
            SalesPlanLine.INIT;
            SalesPlanLine."Sales Order No." := SalesLine."Document No.";
            SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
            SalesPlanLine."Item No." := SalesLine."No.";

            SalesPlanLine."Variant Code" := SalesLine."Variant Code";
            SalesPlanLine.Description := SalesLine.Description;
            SalesPlanLine."Shipment Date" := SalesLine."Shipment Date";
            SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Released;
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            SalesPlanLine."Planned Quantity" := SalesLine."Reserved Qty. (Base)";
            /*ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,FALSE);
            ReserveSalesline.FilterReservFor(ReservEntry,SalesLine);
            ReservEntry.SETRANGE("Reservation Status",ReservEntry."Reservation Status"::Reservation);
            IF ReservEntry.FINDSET THEN
              REPEAT
                IF ReservEntry2.GET(ReservEntry."Entry No.",NOT ReservEntry.Positive) THEN
                  CASE ReservEntry2."Source Type" OF
                    DATABASE::"Item Ledger Entry":
                      BEGIN
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Inventory;
                      END;
                    DATABASE::"Requisition Line":
                      BEGIN
                        ReqLine.GET(
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Batch Name",
                          ReservEntry2."Source Ref. No.");
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Planned;
                        SalesPlanLine."Expected Delivery Date" := ReqLine."Due Date";
                      END;
                    DATABASE::"Purchase Line":
                      BEGIN
                        PurchLine.GET(
                          ReservEntry2."Source Subtype",
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Ref. No.");
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::"Firm Planned";
                        SalesPlanLine."Expected Delivery Date" := PurchLine."Expected Receipt Date";
                      END;
                    DATABASE::"Prod. Order Line":
                      BEGIN
                        ProdOrderLine.GET(
                          ReservEntry2."Source Subtype",
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Prod. Order Line");
                        IF ProdOrderLine."Ending Date" > SalesPlanLine."Expected Delivery Date" THEN
                          SalesPlanLine."Expected Delivery Date" := ProdOrderLine."Ending Date";
                        IF ((ProdOrderLine.Status + 1) < SalesPlanLine."Planning Status") OR
                           (SalesPlanLine."Planning Status" = SalesPlanLine."Planning Status"::None)
                        THEN
                          SalesPlanLine."Planning Status" := ProdOrderLine.Status + 1;
                      END;
                  END;
              UNTIL ReservEntry.NEXT = 0;*/
            SalesPlanLine."Needs Replanning" :=
              (SalesPlanLine."Planned Quantity" <> SalesLine."Outstanding Qty. (Base)") OR
              (SalesPlanLine."Expected Delivery Date" > SalesPlanLine."Shipment Date");
            /*CalculateDisposalPlan(
              SalesLine."Variant Code",
              SalesLine."Location Code",SalesLine."Bin Code");*/
            SalesPlanLine.INSERT;
            EXIT(SalesLine."Prod. Qty");
            //UNTIL SalesLine.NEXT = 0;
        END;

    end;


    procedure ValidateProdOrder()
    begin
        CALCFIELDS("Prod. Order Quantity");
        IF "Prod. Order Quantity" > Quantity THEN
            ERROR(Text001);
    end;


    procedure ShowSchedule()
    var
        Schedule: Record Schedule2;
        SalesLine: Record "Sales Line";
    begin
        IF Type = Type::Item THEN BEGIN
            IF (("Tender No." <> '') AND ("Tender Line No." <> 0)) THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                //Schedule.SETRANGE("Item No.","No.");
                //Schedule.SETRANGE(Quantity,Quantity);
                Schedule.FILTERGROUP(2);
                IF Schedule.FINDFIRST THEN BEGIN
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Order;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Schedule.VALIDATE("Unit of Measure Code");
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
            END ELSE
                IF (("Blanket Order No." <> '') AND ("Blanket Order Line No." <> 0)) THEN BEGIN
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Order;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Schedule.VALIDATE("Unit of Measure Code");
                            Schedule."Estimated Total Unit Price" := Schedule."Estimated Unit Price" * Quantity;
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
        END ELSE
            IF Type = Type::"G/L Account" THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                Schedule.FILTERGROUP(2);
                PAGE.RUN(60125, Schedule);
                Schedule.FILTERGROUP(0);
            END;
    end;

    local procedure TypeOnAfterValidate()
    begin
        ItemPanelVisible := Type = Type::Item;
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
            CurrPage.SAVERECORD;

        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("No." <> xRec."No.")
        THEN BEGIN
            CurrPage.SAVERECORD;
            AutoReserve;
            CurrPage.UPDATE(FALSE);
        END;
        "Location Code" := 'PROD';
        MODIFY;
    end;

    local procedure UnitofMeasureCodeC44OnAfterVal()
    begin
        IF Reserve = Reserve::Always THEN BEGIN
            CurrPage.SAVERECORD;
            AutoReserve;
            CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure QuantityOnAfterValidate()
    var
        UpdateIsDone: Boolean;
    begin
        IF Type = Type::Item THEN
            CASE Reserve OF
                Reserve::Always:
                    BEGIN
                        CurrPage.SAVERECORD;
                        AutoReserve;
                        CurrPage.UPDATE(FALSE);
                        UpdateIsDone := TRUE;
                    END;
                Reserve::Optional:
                    IF (Quantity < xRec.Quantity) AND (xRec.Quantity > 0) THEN BEGIN
                        CurrPage.SAVERECORD;
                        CurrPage.UPDATE(FALSE);
                        UpdateIsDone := TRUE;
                    END;
            END;

        IF (Type = Type::Item) AND
           (Quantity <> xRec.Quantity) AND
           NOT UpdateIsDone
        THEN
            CurrPage.UPDATE(TRUE);
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(FALSE);
    end;

    local procedure LocationCodeC42OnAfterValidate()
    begin
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Location Code" <> xRec."Location Code")
        THEN BEGIN
            CurrPage.SAVERECORD;
            AutoReserve;
            CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure ReserveOnAfterValidate()
    begin
        IF (Reserve = Reserve::Always) AND ("Outstanding Qty. (Base)" <> 0) THEN BEGIN
            CurrPage.SAVERECORD;
            AutoReserve;
            CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure ShipmentDateC100OnAfterValidat()
    begin
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Shipment Date" <> xRec."Shipment Date")
        THEN BEGIN
            CurrPage.SAVERECORD;
            AutoReserve;
            CurrPage.UPDATE(FALSE);
        END;
    end;


    procedure CreateOrders(Qtyparam: Decimal) OrdersCreated: Boolean
    var
        Item: Record Item;
        SalesLine: Record "Sales Line";
        ProdOrderFromSale: Codeunit "Event Handling Cust";
    begin
        IF NOT SalesPlanLine.FINDSET THEN
            EXIT;

        REPEAT
            SalesLine.GET(
              SalesLine."Document Type"::Order,
              SalesPlanLine."Sales Order No.",
              SalesPlanLine."Sales Order Line No.");
            //SalesLine.TESTFIELD("Shipment Date");
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(SalesLine."No.");
            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
                OrdersCreated := TRUE;
                ProdOrderFromSale.CreateProdOrder2(
                  SalesLine, NewStatus::Released, NewOrderType::ItemOrder, 1);
                IF NewOrderType = NewOrderType::ProjectOrder THEN
                    EXIT;
            END;
        //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;

    procedure ForceTotalsCalculation()
    var
        DocumentTotals: Codeunit "Document Totals";

    begin
        DocumentTotals.SalesDocTotalsNotUpToDate();
    end;

}

