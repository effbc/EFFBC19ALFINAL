page 60314 "Incldue Holidays Page"
{
    PageType = List;
    SourceTable = "Holidays Master";
    SourceTableView = WHERE("Working Sunday" = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Of Holiday"; "Date Of Holiday")
                {
                }
                field(Reason; Reason)
                {
                }
                field("Holiday Type"; "Holiday Type")
                {

                    trigger OnValidate();
                    begin
                        IF "Holiday Type" = "Holiday Type"::Sunday THEN
                            ERROR('You can not select sundays Here');
                    end;
                }
            }
        }
    }

    actions
    {
    }
}

