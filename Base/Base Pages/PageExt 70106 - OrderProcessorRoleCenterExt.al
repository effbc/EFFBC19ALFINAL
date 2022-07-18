pageextension 70106 OrderProcessorRoleCenterExt extends "Order Processor Role Center"
{

    layout
    {


        /* modify(Control1900724808)
         {



             ShowCaption = false;
         }



         modify(Control1900724708)
         {



             ShowCaption = false;
         }

         modify(Control 1903012608)
         {


             Enabled = FALSE;



         }*/



    }
    actions
    {


        modify("Sales &Quote")
        {


            Promoted = false;

        }
        modify("Sales &Invoice")
        {


            Promoted = false;


        }
        modify("Sales &Order")
        {


            Promoted = false;


        }
        modify("Sales &Return Order")
        {


            Promoted = false;


        }
        modify("Sales &Credit Memo")
        {


            Promoted = false;


        }


        addafter("Sales &Quote")
        {
            action("Sales - Invoice")
            {
                RunObject = Report "Sales invoices";
            }
        }
        addafter("Purchase Invoices")
        {
            action("General Journal")
            {
                CaptionML = ENU = 'General Journal',
                            ENN = 'Purchase Invoices';
                RunObject = Page "General Journal Batches";
            }
        }
        addafter("Posted Documents")
        {
            group("Thin Client")
            {
                Caption = 'Thin Client';
                separator(General)
                {
                    Caption = 'General';
                    IsHeader = true;
                }
                action(" Item List")
                {
                    CaptionML = ENU = ' Item List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                }
                action("Material Requests List")
                {
                    CaptionML = ENU = 'Material Requests List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Material Requests List";
                }
                action("DC List")
                {
                    CaptionML = ENU = 'DC List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "DC List";
                }
                action("Posted Material Issue List")
                {
                    CaptionML = ENU = 'Posted Material Issue List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Posted Material Issue List";
                }
                separator(Service)
                {
                    Caption = 'Service';
                    IsHeader = true;
                }
                action("Site Issues List")
                {
                    CaptionML = ENU = 'Site Issues List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Site Issues List";
                }
                action("<Page CS Transaction List>")
                {
                    Caption = 'CS Site Transactions';
                    RunObject = Page "CS Transaction List";
                }
                action("Page Service List")
                {
                    CaptionML = ENU = 'Service Order',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Service List";
                    Scope = Page;
                }
                action("Service Item")
                {
                    CaptionML = ENU = 'Service Item',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Service Item List";
                }
                action("Service Tasks")
                {
                    Caption = 'Service Tasks';
                    RunObject = Page "Service Item Lines";
                }
                action("Page Site Stock Updation")
                {
                    Caption = 'Site Stock Updation';
                    RunObject = Page "Site Stock Updation";
                }
                separator(Finance)
                {
                    Caption = 'Finance';
                }
                action("Chart of Accounts")
                {
                    CaptionML = ENU = 'Chart of Accounts',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Chart of Accounts";
                }
                action(Action1102152008)
                {
                    CaptionML = ENU = 'Posted Sales Invoices',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page 132;
                }
                action("Inspection Data Sheet List")
                {
                    CaptionML = ENU = 'Inspection Data Sheet List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Inspection Data Sheet List";
                }
                action("Inspection Receipt List")
                {
                    CaptionML = ENU = 'Inspection Receipt List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Inspection Receipt List";
                }
                action("Posted Inspect Data Sheet List")
                {
                    CaptionML = ENU = 'Posted Inspect Data Sheet List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Posted Inspect Data Sheet List";
                }
                action("<Page Posted Inspect. Receipt List>")
                {
                    CaptionML = ENU = 'Posted Inspect. Receipt List',
                                ENN = 'Items';
                    Image = Item;
                    RunObject = Page "Posted Inspect. Receipt List";
                }
            }
        }
    }


}

