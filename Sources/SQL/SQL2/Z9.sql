/*ÏÍÐ */

SELECT 	'ÏÍÐ data_estimate -> STOIM        (cr.RATE_CODE,1)'	as O1,
	sum(cr_de.stoim) 					as C1,
	
	'ÏÍÐ data_estimate -> ZP           (cr.RATE_CODE,1)'	as O2,
	sum(cr_de.zp) 						as C2,

	'ÏÍÐ data_estimate -> OHROPR       (cr.RATE_CODE,1)'	as O3,
	sum(cr_de.ohropr) 					as C3,
	
	'ÏÍÐ data_estimate -> PLAN_PRIB    (cr.RATE_CODE,1)'	as O4,
	sum(cr_de.plan_prib) 					as C4

FROM 	card_rate cr  



INNER JOIN
  

	(
SELECT 	id_tables,

			
			de.zp,

			
			de.stoim,
			
			de.ohropr,

			de.plan_prib

	FROM 	`smetasourcedata` `ssd` 
	
	INNER JOIN `smetasourcedata` `ssd1` 	ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID` 	AND `ssd1`.`SM_TYPE` 	= 1


	
	INNER JOIN `smetasourcedata` `ssd2` 	ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`  AND `ssd2`.`SM_TYPE` 	= 3 


	
	INNER JOIN `data_estimate` `de` 	ON  `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID` 
	
	WHERE 	`ssd`.`SM_ID` = :SM_ID )   cr_de ON  cr_de.id_tables = cr.id 



WHERE  left(cr.RATE_CODE,1)>0



