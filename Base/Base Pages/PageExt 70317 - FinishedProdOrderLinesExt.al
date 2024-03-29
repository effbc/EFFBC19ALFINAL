pageextension 70317 FinishedProdOrderLinesExt extends "Finished Prod. Order Lines"
{
    layout
    {
        addafter("Due Date")
        {
            field("WIP QC Enabled"; Rec."WIP QC Enabled")
            {

            }
            field("WIP Spec Id"; Rec."WIP Spec Id")
            {

            }
            field("Quantity Sent To Quality"; Rec."Quantity Sent To Quality")
            {

            }
            field("Quantity Sending To Quality"; Rec."Quantity Sending To Quality")
            {

            }
            field("Quantity Accepted"; Rec."Quantity Accepted")
            {

            }
            field("Quantity Rework"; Rec."Quantity Rework")
            {

            }
        }
    }

    actions
    {
        addafter("Item &Tracking Lines")
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';
                    trigger OnAction()
                    begin
                        //This functionality was copied from page #99000867. Unsupported part was commented. Please check it.
                        /*CurrPage.ProdOrderLines.Page.*/
                        _ShowDataSheets;
                    end;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';
                    trigger OnAction()
                    begin
                        //This functionality was copied from page #99000867. Unsupported part was commented. Please check it.
                        /*CurrPage.ProdOrderLines.Page.*/
                        _ShowPostDataSheets;
                    end;
                }
                action("Inspection Receipt")
                {
                    Caption = 'Inspection Receipt';
                    trigger OnAction()
                    begin
                        //This functionality was copied from page #99000867. Unsupported part was commented. Please check it.
                        /* CurrPage.ProdOrderLines.Page.*/
                        _ShowInspectReceipt;
                    end;
                }
                action("Posted Inspection Receipt")
                {
                    Caption = 'Posted Inspection Receipt';
                    trigger OnAction()
                    begin
                        //This functionality was copied from page #99000867. Unsupported part was commented. Please check it.
                        /*CurrPage.ProdOrderLines.Page.*/
                        _ShowPostInspectReceipt;
                    end;
                }
            }
        }
    }

    PROCEDURE "--WIP--"();
    BEGIN
    END;

    PROCEDURE _ShowDimensions();
    BEGIN
        Rec.ShowDimensions;
    END;

    PROCEDURE _ShowDataSheets();
    VAR
        InspectDataSheet: Record "Inspection Datasheet Header";
    BEGIN
        Rec.ShowDataSheets;
    END;



    PROCEDURE _ShowPostDataSheets();
    VAR
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    BEGIN
        Rec.ShowPostDataSheets;
    END;



    PROCEDURE _ShowInspectReceipt();
    VAR
        InspectionReceipt: Record "Inspection Receipt Header";
    BEGIN
        Rec.ShowInspectReceipt;
    END;



    PROCEDURE _ShowPostInspectReceipt();
    VAR
        InspectionReceipt: Record "Inspection Receipt Header";
    BEGIN
        Rec.ShowPostInspectReceipt;
    END;


}