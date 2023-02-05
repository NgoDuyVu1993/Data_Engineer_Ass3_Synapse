IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacityass_udacityasssynapse_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacityass_udacityasssynapse_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacityass@udacityasssynapse.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_payment (
	[payment_id] bigint,
	[date] varchar(50),
	[amount] float,
	[account_number] bigint
	)
	WITH (
	LOCATION = 'payment.csv',
	DATA_SOURCE = [udacityass_udacityasssynapse_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO
