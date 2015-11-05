/* муссор С310,311 */



SELECT	'муссор С310,311 (transpcard  data_estimate(ID_TYPE_DATA` = 7 or `de`.`ID_TYPE_DATA` = 9))'     as O1,
	SUM(TRANSP_SUM_NO_NDS) as C1


FROM `smetasourcedata` `ssd`


	
	INNER JOIN `smetasourcedata`  `ssd1` 	ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID` 	AND `ssd1`.`SM_TYPE` 	 = 1

	

	INNER JOIN `smetasourcedata`  `ssd2`	ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`	AND `ssd2`.`SM_TYPE` 	 = 3 	
	

	
	INNER JOIN `data_estimate` `de` 	ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`  AND  (`de`.`ID_TYPE_DATA` = 7 or `de`.`ID_TYPE_DATA` = 9)


	
	INNER JOIN `transpcard` `mtc` 		ON `mtc`.`ID` = `de`.`ID_TABLES` 	



WHERE `ssd`.`SM_ID` = :SM_ID