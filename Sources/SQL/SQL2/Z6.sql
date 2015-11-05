
/*devicescard_act*/

 
select 	'devicescard_act -> DEVICE_SUM_NO_NDS    * (`dc`.`PROC_ZAC` / 100)'	as  O1,
	SUM(DEVICE_SUM_NO_NDS    * (`dc`.`PROC_ZAC` / 100)) 			as  C1,
	
	'devicescard_act -> DEVICE_SUM_NO_NDS    * (`dc`.`PROC_PODR` / 100)'	as  O2,
	SUM(DEVICE_SUM_NO_NDS    * (`dc`.`PROC_PODR` / 100)) 			as  C2, 
	
	'devicescard_act -> DEVICE_TRANSP_NO_NDS * (`dc`.`PROC_ZAC` / 100)'	as  O3,
	SUM(DEVICE_TRANSP_NO_NDS * (`dc`.`PROC_ZAC` / 100)) 			as  C3,  
  
	'devicescard_act -> DEVICE_TRANSP_NO_NDS * (`dc`.`PROC_PODR` / 100)'	as  O4,	
	SUM(DEVICE_TRANSP_NO_NDS * (`dc`.`PROC_PODR` / 100)) 			as  C4 

FROM `smetasourcedata` `ssd`

INNER JOIN `smetasourcedata`  `ssd1` 	ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID` 	AND `ssd1`.`SM_TYPE` 	= 1

INNER JOIN `smetasourcedata`  `ssd2`	ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`	AND `ssd2`.`SM_TYPE` 	= 3 

INNER JOIN `data_act`   	`de` 	ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`  AND `de`.`ID_TYPE_DATA` = 4

INNER JOIN `devicescard_act` 	`dc` 	ON `dc`.`ID` = `de`.`ID_TABLES`

WHERE `ssd`.`SM_ID` = :SM_ID
