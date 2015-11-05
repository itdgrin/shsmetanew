
/*data_estimate*/

select 	'data_estimate -> ZP'						as  O1, 
	SUM(zp)								as  C1,		 
	
	'data_estimate -> ZP_MASH'					as  O2,
	SUM(ZP_MASH)							as  C2,	
	
	'data_estimate -> EMiM'						as  O3,
	SUM(EMiM)							as  C3,

	'data_estimate -> MR'						as  O4,	
	SUM(MR)								as  C4, 

	'data_estimate -> TRANSP (ID_TYPE_DATA <> 7 and ID_TYPE_DATA <> 9)'		as  O5,	
	SUM(if(`de`.`ID_TYPE_DATA` <> 7 and `de`.`ID_TYPE_DATA` <> 9,TRANSP	,0))	as  C5,	 
	
	'data_estimate -> ZIM_UDOR'					as O6,
	SUM(ZIM_UDOR)							as C6, 
	
	'data_estimate -> AVG(TRUD)'					as O7,
	AVG(TRUD)							as C7,	 
	
	'data_estimate -> TRUD'						as O8,
	SUM(TRUD)							as C8,

	'data_estimate -> TRUD_MASH'					as O9,
	SUM(TRUD_MASH)							as C9,	 
	
	'data_estimate -> STOIM  оборудование (ID_TYPE_DATA = 4)'	as O10,	
	SUM(if(`de`.`ID_TYPE_DATA` = 4 ,STOIM	,0))			as C10,	 
	
	'data_estimate -> TRANSP оборудование (ID_TYPE_DATA = 4)'	as O11,	
	SUM(if(`de`.`ID_TYPE_DATA` = 4 ,TRANSP	,0))			as C11,	 
	
	'data_estimate -> STOIM свалка (ID_TYPE_DATA = 5)'		as O12,	
	SUM(if(`de`.`ID_TYPE_DATA` = 5 ,STOIM	,0))			as C12,	 
	
	'data_estimate -> STOIM материал (ID_TYPE_DATA =2)'		as O13,	
	SUM(if(`de`.`ID_TYPE_DATA` = 2 ,STOIM	,0))			as C13,

	'data_estimate -> ZP_ZIM_UDOR'					as O14,
	SUM(ZP_ZIM_UDOR)						as C14

FROM `smetasourcedata` `ssd`

INNER JOIN `smetasourcedata` `ssd2`	ON `ssd2`.`PARENT_ID` = `ssd`.`SM_ID`	AND `ssd2`.`SM_TYPE` 	= 3 

INNER JOIN `data_estimate` `de` 	ON  `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID` 

WHERE `ssd`.`SM_ID` = :SM_ID