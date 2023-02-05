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

CREATE EXTERNAL TABLE dbo.staging_station (
	[station_id] nvarchar(60),
	[name] nvarchar(60),
	[latitude] float,
	[longitude] float
	)
	WITH (
	LOCATION = 'station.csv',
	DATA_SOURCE = [udacityass_udacityasssynapse_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_station
GO