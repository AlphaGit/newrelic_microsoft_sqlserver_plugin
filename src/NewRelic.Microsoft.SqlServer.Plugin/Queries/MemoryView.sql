
SELECT
	(SELECT
		cntr_value
	FROM sys.dm_os_performance_counters
	WHERE counter_name = 'Buffer cache hit ratio') / (SELECT
														cntr_value
														FROM sys.dm_os_performance_counters
														WHERE counter_name = 'Buffer cache hit ratio base')
	* 100.00 AS 'BufferCacheHitRatio',
	(SELECT
		cntr_value
	FROM sys.dm_os_performance_counters
	WHERE counter_name = 'Page life expectancy' AND OBJECT_NAME LIKE '%Manager%')
	AS 'PageLifeExpectancyInSeconds',
	(SELECT
		cntr_value
	FROM sys.dm_os_performance_counters
	WHERE counter_name = 'Page life expectancy' AND OBJECT_NAME NOT LIKE '%Manager%')
	AS 'PageLifeExpectancyInSeconds-NUMA'