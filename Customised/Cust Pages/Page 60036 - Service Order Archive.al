page 60036 "Service Order Archive"
{
    // version B2B1.0,Rev01

    Caption = 'Service Quote Archive';
    Editable = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Service Header Archive";
    SourceTableView = WHERE("Document Type" = CONST(Order));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code/City';
                    ApplicationArea = All;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    Caption = 'Phone No./Phone No. 2';
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Phone No. 2"; Rec."Phone No. 2")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Notify Customer"; Rec."Notify Customer")
                {
                    ApplicationArea = All;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                    ApplicationArea = All;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Response Date"; Rec."Response Date")
                {
                    ApplicationArea = All;
                }
                field("Response Time"; Rec."Response Time")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
            }
            part(ServItemLine; "Service Order Archive Subform")
            {
                Editable = false;
                SubPageLink = "Document No." = FIELD("No."), "Doc. No. Occurrence" = FIELD("Doc. No. Occurrence"), "Version No." = FIELD("Version No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code/City';
                }
                field("Bill-to City"; "Bill-to City")
                {
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                }
                field("Your Reference"; "Your Reference")
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Job No."; "Job No.")
                {
                    Caption = 'Job No.';
                }
                field("Max. Labor Unit Price"; "Max. Labor Unit Price")
                {
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {

                    trigger OnValidate();
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code/City';
                }
                field("Ship-to City"; "Ship-to City")
                {
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                }
                field("Ship-to Phone"; "Ship-to Phone")
                {
                    Caption = 'Ship-to Phone/Phone 2';
                }
                field("Ship-to Phone 2"; "Ship-to Phone 2")
                {
                }
                field("Ship-to E-Mail"; "Ship-to E-Mail")
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Warning Status"; "Warning Status")
                {
                }
                field("Link Service to Service Item"; "Link Service to Service Item")
                {
                }
                field("Allocated Hours"; "Allocated Hours")
                {
                }
                field("No. of Allocations"; "No. of Allocations")
                {
                }
                field("No. of Unallocated Items"; "No. of Unallocated Items")
                {
                }
                field("Service Zone Code"; "Service Zone Code")
                {
                }
                field("Order Date"; "Order Date")
                {
                }
                field("Order Time"; "Order Time")
                {
                }
                field("Starting Date"; "Starting Date")
                {
                }
                field("Starting Time"; "Starting Time")
                {
                }
                field("Actual Response Time (Hours)"; "Actual Response Time (Hours)")
                {
                }
                field("Finishing Date"; "Finishing Date")
                {
                }
                field("Finishing Time"; "Finishing Time")
                {

                    trigger OnValidate();
                    begin
                        FinishingTimeOnAfterValidate;
                    end;
                }
            }
            group(" Foreign Trade")
            {
                Caption = '" Foreign Trade"';
                field("Currency Code"; "Currency Code")
                {

                    trigger OnAssistEdit();
                    begin
                        ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Posting Date");
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                            VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Restore")
            {
                Caption = '&Restore';
                Ellipsis = true;
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    ArchiveManagement: Codeunit "Custom Events";
                begin
                    ArchiveManagement.RestoreServiceDocument(Rec);
                end;
            }
        }
    }

    var
        Text004: Label 'You cannot open the form because %1 is %2 in the %3 table.';
        ServMgtSetup: Record "Service Mgt. Setup";
        ServItemLine: Record "Service Item Line";
        RepairStatus: Record "Repair Status";
        ServOrderMgt: Codeunit ServOrderManagement;
        ServLogMgt: Codeunit ServLogManagement;
        //Mail: Codeunit Mail;
        ServItemMgt: Codeunit ServItemManagement;
        UserMgt: Codeunit "User Setup Management";
        CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
        ChangeExchangeRate: Page 511;
        FaultResolutionRelation: Page "Fault/Resol. Cod. Relationship";


    local procedure CustomerNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;


    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;


    local procedure ShiptoCodeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;


    local procedure FinishingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE(TRUE);
    end;
}

