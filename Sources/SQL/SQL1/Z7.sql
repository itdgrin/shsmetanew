/* mechanizmcard_act */


select 	'mechanizmcard_act -> MECH_SUM_NO_NDS * (`mtc`.`PROC_PODR` / 100)'	as O1, 
	round(sum(rezult.MECH_PROC_PODR)) 					as C1, 	 
	
	'mechanizmcard_act -> MECH_SUM_NO_NDS * ( `mtc`.`PROC_ZAC` / 100)'	as O2, 
	round(sum(rezult.MECH_PROC_ZAC)) 					as C2,
	
	'mechanizmcard_act -> ZP_MACH_NO_NDS	* (`mtc`.`PROC_PODR` / 100)'	as O3, 
	round(sum(ZP_MACH_NO_NDS_PODR)) 					as C3, 	 
	
	'mechanizmcard_act -> ZP_MACH_NO_NDS	* ( `mtc`.`PROC_ZAC` / 100)'	as O4, 
	round(sum(ZP_MACH_NO_NDS_ZAC)) 						as C4  	 	 

from (

	select 	MECH_SUM_NO_NDS * (`mtc`.`PROC_PODR` / 100)   		as MECH_PROC_PODR,

		MECH_SUM_NO_NDS * ( `mtc`.`PROC_ZAC` / 100)   		as MECH_PROC_ZAC,
		
		ZP_MACH_NO_NDS	* (`mtc`.`PROC_PODR` / 100)   		as ZP_MACH_NO_NDS_PODR,
		
		ZP_MACH_NO_NDS	* ( `mtc`.`PROC_ZAC` / 100)   		as ZP_MACH_NO_NDS_ZAC


	FROM `smetasourcedata` `ssd`

	INNER JOIN `smetasourcedata` `ssd2` 	ON `ssd2`.`PARENT_ID` = `ssd`.`SM_ID`   AND `ssd2`.`SM_TYPE` 	= 3 

	INNER JOIN `data_act` 		`de` 	ON  `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID` AND `de`.`ID_TYPE_DATA` = 1

	INNER JOIN `card_rate_act` 	`cr` 	ON `cr`.`ID` = `de`.`ID_TABLES`

	INNER JOIN `mechanizmcard_act` `mtc` 	ON `mtc`.`ID_CARD_RATE` = `cr`.`ID`

	WHERE `ssd`.`SM_ID` = :SM_ID

union

	select 	MECH_SUM_NO_NDS * (`mtc`.`PROC_PODR` / 100) 		as MECH_PROC_PODR, 
		
		MECH_SUM_NO_NDS * ( `mtc`.`PROC_ZAC` / 100)  		as MECH_PROC_ZAC,
		
		ZP_MACH_NO_NDS	* (`mtc`.`PROC_PODR` / 100)   		as ZP_MACH_NO_NDS_PODR,
		
		ZP_MACH_NO_NDS	* ( `mtc`.`PROC_ZAC` / 100)   		as ZP_MACH_NO_NDS_ZAC

	FROM `smetasourcedata` `ssd`

	INNER JOIN `smetasourcedata` `ssd2` 	ON `ssd2`.`PARENT_ID` = `ssd`.`SM_ID`   AND `ssd2`.`SM_TYPE` 	= 3  

	INNER JOIN `data_act` 		`de` 	ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID` 	AND `de`.`ID_TYPE_DATA` = 2

	INNER JOIN `mechanizmcard_act` `mtc` 	ON `mtc`.`ID` = `de`.`ID_TABLES` 	AND `mtc`.`ID_CARD_RATE` = 0

WHERE `ssd`.`SM_ID` = :SM_ID) as rezult