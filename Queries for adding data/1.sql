BEGIN
DECLARE
@Counter int= 1
WHILE @Counter < = 30
BEGIN INSERT INTO [dbo].[batch_activation_data]           
([batch_id]           
,[declared_end_date]           
,[declared_start_date]           
,[declared_wasted_not_scanned]           
,[end_date_time]           
,[linked_status]           
,[manufacturer_batch_id]           
,[product_ean]           
,[status]           
,[unique_line_id]           
,[user_id]           
,[production_batch_id])     
VALUES           
('PHYSICAL TRACKABLE-27122022102015',    
'2022-12-27 10:21:00.000',    
'2022-12-27 10:20:15.000',    
0,    
'2022-12-27 10:21:00.000',    
NULL,    
'PHYSICAL TRACKABLE-27122022102015GHI' + Cast(@counter as varchar),    
'98765432204',    
'COMPLETED_PROCESSING',    
'PROD1-1',    
'admin',    
NULL);
SET @Counter= @Counter + 1
END
END