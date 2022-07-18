page 60312 Holidays
{
    PageType = List;
    SourceTable = "Holidays Master";
    SourceTableView = WHERE("Working Sunday" = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Of Holiday"; "Date Of Holiday")
                {

                    trigger OnValidate();
                    begin
                        IF DATE2DWY("Date Of Holiday", 1) <> 7 THEN
                            ERROR('You can not select other than Sundays');
                    end;
                }
                field(Reason; Reason)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        IF DATE2DWY("Date Of Holiday", 1) = 7 THEN BEGIN
            "Holiday Type" := "Holiday Type"::Sunday;
            "Working Sunday" := TRUE;
        END;
    end;
}

