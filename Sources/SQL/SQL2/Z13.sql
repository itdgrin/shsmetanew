select 			sum(if(cr.WORK_ID=1,  	de.OHROPR	,0)) 	as C1 ,
			sum(if(cr.WORK_ID=1,  	de.PLAN_PRIB,0)) 	as C2 ,
			max(if(cr.WORK_ID=1, 	cr.OHROPR	,0)) 	as C3 ,
			max(if(cr.WORK_ID=1, 	cr.PLAN_PRIB,0)) 	as C4 , 

			sum(if(cr.WORK_ID=2,  	de.OHROPR	,0)) 	as C5,
			sum(if(cr.WORK_ID=2,  	de.PLAN_PRIB,0)) 	as C6,
			max(if(cr.WORK_ID=2, 	cr.OHROPR	,0)) 	as C7,
			max(if(cr.WORK_ID=2, 	cr.PLAN_PRIB,0)) 	as C8,

			sum(if(cr.WORK_ID=3,  	de.OHROPR	,0)) 	as C9 ,
			sum(if(cr.WORK_ID=3,  	de.PLAN_PRIB,0)) 	as C10 ,
			max(if(cr.WORK_ID=3, 	cr.OHROPR	,0)) 	as C11 ,
			max(if(cr.WORK_ID=3, 	cr.PLAN_PRIB,0)) 	as C12 ,

			sum(if(cr.WORK_ID=4,  	de.OHROPR	,0)) 	as C13 ,
			sum(if(cr.WORK_ID=4,  	de.PLAN_PRIB,0)) 	as C14 ,
			max(if(cr.WORK_ID=4, 	cr.OHROPR	,0)) 	as C15 ,
			max(if(cr.WORK_ID=4, 	cr.PLAN_PRIB,0)) 	as C16 ,

			sum(if(cr.WORK_ID=5,  	de.OHROPR	,0)) 	as C17 ,
			sum(if(cr.WORK_ID=5,  	de.PLAN_PRIB,0)) 	as C18 ,
			max(if(cr.WORK_ID=5, 	cr.OHROPR	,0)) 	as C19 ,
			max(if(cr.WORK_ID=5, 	cr.PLAN_PRIB,0)) 	as C20 ,

			sum(if(cr.WORK_ID=6,  	de.OHROPR	,0)) 	as C21 ,
			sum(if(cr.WORK_ID=6,  	de.PLAN_PRIB,0)) 	as C22,
			max(if(cr.WORK_ID=6, 	cr.OHROPR	,0)) 	as C23 ,
			max(if(cr.WORK_ID=6, 	cr.PLAN_PRIB,0)) 	as C24 ,

			sum(if(cr.WORK_ID=7,  	de.OHROPR	,0)) 	as C25 ,
			sum(if(cr.WORK_ID=7,  	de.PLAN_PRIB,0)) 	as C26 ,
			max(if(cr.WORK_ID=7, 	cr.OHROPR	,0)) 	as C27 ,
			max(if(cr.WORK_ID=7, 	cr.PLAN_PRIB,0)) 	as C28 ,

			sum(if(cr.WORK_ID=8,  	de.OHROPR	,0)) 	as C29 ,
			sum(if(cr.WORK_ID=8,  	de.PLAN_PRIB,0)) 	as C30 ,
			max(if(cr.WORK_ID=8, 	cr.OHROPR	,0)) 	as C31 ,
			max(if(cr.WORK_ID=8, 	cr.PLAN_PRIB,0)) 	as C32 ,

			sum(if(cr.WORK_ID=9,  	de.OHROPR	,0)) 	as C33 ,
			sum(if(cr.WORK_ID=9,  	de.PLAN_PRIB,0)) 	as C34 ,
			max(if(cr.WORK_ID=9, 	cr.OHROPR	,0)) 	as C35 ,
			max(if(cr.WORK_ID=9, 	cr.PLAN_PRIB,0)) 	as C36 ,

			sum(if(cr.WORK_ID=10,  	de.OHROPR	,0)) 	as C37 ,
			sum(if(cr.WORK_ID=10,  	de.PLAN_PRIB,0)) 	as C38 ,
			max(if(cr.WORK_ID=10, 	cr.OHROPR	,0)) 	as C39 ,
			max(if(cr.WORK_ID=10, 	cr.PLAN_PRIB,0)) 	as C40 ,

			sum(if(cr.WORK_ID=11,  	de.OHROPR	,0)) 	as C41 ,
			sum(if(cr.WORK_ID=11,  	de.PLAN_PRIB,0)) 	as C42 ,
			max(if(cr.WORK_ID=11, 	cr.OHROPR	,0)) 	as C43 ,
			max(if(cr.WORK_ID=11, 	cr.PLAN_PRIB,0)) 	as C44 ,

			sum(if(cr.WORK_ID=12,  	de.OHROPR	,0)) 	as C45 ,
			sum(if(cr.WORK_ID=12,  	de.PLAN_PRIB,0)) 	as C46 ,
			max(if(cr.WORK_ID=12, 	cr.OHROPR	,0)) 	as C47 ,
			max(if(cr.WORK_ID=12, 	cr.PLAN_PRIB,0)) 	as C48 ,

			sum(if(cr.WORK_ID=13,  	de.OHROPR	,0)) 	as C49 ,
			sum(if(cr.WORK_ID=13,  	de.PLAN_PRIB,0)) 	as C50 ,
			max(if(cr.WORK_ID=13, 	cr.OHROPR	,0)) 	as C51 ,
			max(if(cr.WORK_ID=13, 	cr.PLAN_PRIB,0)) 	as C52 ,

			sum(if(cr.WORK_ID=14,  	de.OHROPR	,0)) 	as C53 ,
			sum(if(cr.WORK_ID=14,  	de.PLAN_PRIB,0)) 	as C54 ,
			max(if(cr.WORK_ID=14, 	cr.OHROPR	,0)) 	as C55 ,
			max(if(cr.WORK_ID=14, 	cr.PLAN_PRIB,0)) 	as C56,

			sum(if(cr.WORK_ID=15,  	de.OHROPR	,0)) 	as C57 ,
			sum(if(cr.WORK_ID=15,  	de.PLAN_PRIB,0)) 	as C58 ,
			max(if(cr.WORK_ID=15, 	cr.OHROPR	,0)) 	as C59 ,
			max(if(cr.WORK_ID=15, 	cr.PLAN_PRIB,0)) 	as C60 ,

			sum(if(cr.WORK_ID=16,  	de.OHROPR	,0)) 	as C61 ,
			sum(if(cr.WORK_ID=16,  	de.PLAN_PRIB,0)) 	as C62 ,
			max(if(cr.WORK_ID=16, 	cr.OHROPR	,0)) 	as C63 ,
			max(if(cr.WORK_ID=16, 	cr.PLAN_PRIB,0)) 	AS C64 ,

			sum(if(cr.WORK_ID=17,  	de.OHROPR	,0)) 	as C65 ,
			sum(if(cr.WORK_ID=17,  	de.PLAN_PRIB,0)) 	as C66 ,
			max(if(cr.WORK_ID=17, 	cr.OHROPR	,0)) 	as C67 ,
			max(if(cr.WORK_ID=17, 	cr.PLAN_PRIB,0)) 	as C68 ,

			sum(if(cr.WORK_ID=18,  	de.OHROPR	,0)) 	as C69 ,
			sum(if(cr.WORK_ID=18,  	de.PLAN_PRIB,0)) 	as C70 ,
			max(if(cr.WORK_ID=18, 	cr.OHROPR	,0)) 	as C71 ,
			max(if(cr.WORK_ID=18, 	cr.PLAN_PRIB,0)) 	as C72 ,

			sum(if(cr.WORK_ID=19,  	de.OHROPR	,0)) 	as C73 ,
			sum(if(cr.WORK_ID=19,  	de.PLAN_PRIB,0)) 	as C74 ,
			max(if(cr.WORK_ID=19, 	cr.OHROPR	,0)) 	as C75 ,
			max(if(cr.WORK_ID=19, 	cr.PLAN_PRIB,0)) 	as C76 ,

			sum(if(cr.WORK_ID=20,  	de.OHROPR	,0)) 	as C77 ,
			sum(if(cr.WORK_ID=20,  	de.PLAN_PRIB,0)) 	as C78 ,
			max(if(cr.WORK_ID=20, 	cr.OHROPR	,0)) 	as C79 ,
			max(if(cr.WORK_ID=20, 	cr.PLAN_PRIB,0)) 	as C80 ,

			sum(if(cr.WORK_ID=21,  	de.OHROPR	,0)) 	as C81 ,
			sum(if(cr.WORK_ID=21,  	de.PLAN_PRIB,0)) 	as C82 ,
			max(if(cr.WORK_ID=21, 	cr.OHROPR	,0)) 	as C83 ,
			max(if(cr.WORK_ID=21, 	cr.PLAN_PRIB,0)) 	as C84 ,

			sum(if(cr.WORK_ID=22,  	de.OHROPR	,0)) 	as C85 ,
			sum(if(cr.WORK_ID=22,  	de.PLAN_PRIB,0)) 	as C86 ,
			max(if(cr.WORK_ID=22, 	cr.OHROPR	,0)) 	as C87 ,
			max(if(cr.WORK_ID=22, 	cr.PLAN_PRIB,0)) 	as C88

FROM `smetasourcedata` `ssd`

INNER JOIN `smetasourcedata` `ssd1` 	ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID` 	AND `ssd1`.`SM_TYPE` 	= 1

INNER JOIN `smetasourcedata` `ssd2`	ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`	AND `ssd2`.`SM_TYPE` 	= 3 

INNER JOIN `data_estimate` `de` 	ON  `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`  

INNER JOIN `card_rate` `cr` 		ON `cr`.`ID` = `de`.`ID_TABLES`

WHERE `ssd`.`SM_ID` = :SM_ID
