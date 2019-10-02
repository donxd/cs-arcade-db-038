/*Please add ; after each select statement*/
CREATE PROCEDURE importantEvents()
BEGIN
    SELECT 
        dataEvents.id, 
        dataEvents.name, 
        dataEvents.event_date, 
        dataEvents.participants 
        -- dataEvents.day_week
    FROM (
        SELECT 
            id, 
            name, 
            event_date, 
            participants, 
            CASE 
                DAYOFWEEK(event_date)
                WHEN 1 THEN 8
                ELSE DAYOFWEEK(event_date)
            END 
            AS day_week
        FROM events
    ) dataEvents
    ORDER BY day_week ASC, participants DESC;
END