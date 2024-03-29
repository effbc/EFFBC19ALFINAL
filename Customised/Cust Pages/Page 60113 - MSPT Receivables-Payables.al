page 60113 "MSPT Receivables-Payables"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Receivables-Payables

    Caption = 'MSPT Receivables-Payables';
    PageType = List;
    SaveValues = true;
    SourceTable = "General Ledger Setup";

    layout
    {
        area(content)
        {
            part(MSPTReceivPayablesLines; "MSPTReceivables-Payables Lines")
            {
                ApplicationArea = All;
            }
            field(PeriodType; PeriodType)
            {
                OptionCaption = 'Day,Week,Month,Quarter,Year,Period';
                ToolTip = 'Day';
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    IF PeriodType = PeriodType::Period THEN
                        PeriodPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Year THEN
                        YearPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Quarter THEN
                        QuarterPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Month THEN
                        MonthPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Week THEN
                        WeekPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Day THEN
                        DayPeriodTypeOnValidate;
                end;
            }
            field(AmountType; AmountType)
            {
                OptionCaption = 'Net Change,Balance at Date';
                ToolTip = 'Net Change';
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    IF AmountType = AmountType::"Balance at Date" THEN
                        BalanceatDateAmountTypeOnValid;
                    IF AmountType = AmountType::"Net Change" THEN
                        NetChangeAmountTypeOnValidate;
                end;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        UpdateSubForm;
    end;

    var
        PeriodType: Option Day,Week,Month,Quarter,Year,Period;
        AmountType: Option "Net Change","Balance at Date";

   
    procedure UpdateSubForm();
    begin
        CurrPage.MSPTReceivPayablesLines.PAGE.Set(Rec, PeriodType, AmountType);
    end;

   
    local procedure DayPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure WeekPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure MonthPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure QuarterPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure YearPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure PeriodPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure NetChangeAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure BalanceatDateAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

   
    local procedure DayPeriodTypeOnValidate();
    begin
        DayPeriodTypeOnPush;
    end;

   
    local procedure WeekPeriodTypeOnValidate();
    begin
        WeekPeriodTypeOnPush;
    end;

   
    local procedure MonthPeriodTypeOnValidate();
    begin
        MonthPeriodTypeOnPush;
    end;

   
    local procedure QuarterPeriodTypeOnValidate();
    begin
        QuarterPeriodTypeOnPush;
    end;

   
    local procedure YearPeriodTypeOnValidate();
    begin
        YearPeriodTypeOnPush;
    end;

   
    local procedure PeriodPeriodTypeOnValidate();
    begin
        PeriodPeriodTypeOnPush;
    end;

   
    local procedure NetChangeAmountTypeOnValidate();
    begin
        NetChangeAmountTypeOnPush;
    end;

   
    local procedure BalanceatDateAmountTypeOnValid();
    begin
        BalanceatDateAmountTypeOnPush;
    end;
}

