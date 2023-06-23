DECLARE @counter INT = 1;
DECLARE @records_per_container INT = 15000 / 30;
DECLARE @records_inserted INT = 0; WHILE (@records_inserted < 15000)
BEGIN
    DECLARE @child_counter INT = 1;     WHILE (@child_counter <= @records_per_container)
    BEGIN
     insert into dbo.processed_ranges(detail, range_end, range_start, status, total_stamps, processed_containers_id) 
    values ('A:Activate;CID:AB0000020'+Cast(@counter as varchar)+';RID:AB0000020'+Cast(@counter as varchar)+';RT:Bundle', '840000',    '770001',    'ACTIVATED',    '70000',     
@counter )         SET @child_counter = @child_counter + 1;
    END     SET @records_inserted = @records_inserted + @records_per_container;
    SET @counter = @counter + 1;
END