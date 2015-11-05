SELECT *
FROM
/*материалы в расценках*/ 
((SELECT
	ssd.sm_id  			as sm_id1,
	ssd1.sm_id 			as sm_id2,
	ssd2.sm_id 			as sm_id3,

	ssd.name  			as c1,
	ssd1.name 			as c2,
	ssd2.name 			as c3,
	ssd.sm_number 			as c4,
	ssd1.sm_number 			as c5,
	ssd2.sm_number 			as c6,

	mtc.MAT_CODE			as c7,   
	UCASE(mtc.MAT_NAME) 		as c8,
	mtc.MAT_UNIT			as c9,
	round(sum(mtc.MAT_COUNT),6) 	as c10

FROM smetasourcedata ssd
INNER JOIN smetasourcedata ssd1 ON ssd1.PARENT_ID = ssd.SM_ID  		AND ssd1.SM_TYPE = 1
INNER JOIN smetasourcedata ssd2 ON ssd2.PARENT_ID = ssd1.SM_ID 		AND ssd2.SM_TYPE = 3
INNER JOIN data_estimate de 	ON de.ID_ESTIMATE = ssd2.SM_ID     	AND de.ID_TYPE_DATA IN (1, 2, 5) 
INNER JOIN card_rate cr 	ON cr.ID = de.ID_TABLES
INNER JOIN materialcard mtc 	ON mtc.ID_CARD_RATE = cr.ID
WHERE ssd.SM_ID =:SM_ID     
group by sm_id3,MAT_CODE) 
/******************************************************************************************/
UNION
/******************************************************************************************/
/*материалы вне расценок*/ 
(SELECT
	ssd.sm_id  			as sm_id1,
	ssd1.sm_id 			as sm_id2,
	ssd2.sm_id 			as sm_id3,

	ssd.name  			as c1,
	ssd1.name 			as c2,
	ssd2.name 			as c3,
	ssd.sm_number 			as c4,
	ssd1.sm_number 			as c5,
	ssd2.sm_number 			as c6,

	mtc.MAT_CODE			as c7,   
	UCASE(mtc.MAT_NAME) 		as c8,
	mtc.MAT_UNIT			as c9,
	round(sum(mtc.MAT_COUNT),6) 	as c10

FROM smetasourcedata ssd
INNER JOIN smetasourcedata ssd1 ON ssd1.PARENT_ID = ssd.SM_ID  		AND ssd1.SM_TYPE = 1
INNER JOIN smetasourcedata ssd2 ON ssd2.PARENT_ID = ssd1.SM_ID 		AND ssd2.SM_TYPE = 3
INNER JOIN data_estimate de 	ON de.ID_ESTIMATE = ssd2.SM_ID     	AND de.ID_TYPE_DATA IN (1, 2, 5) 
INNER JOIN materialcard mtc 	ON mtc.ID = de.ID_TABLES    		AND mtc.ID_CARD_RATE = 0
WHERE ssd.SM_ID =:SM_ID     
group by sm_id3,MAT_CODE)
/******************************************************************************************/
UNION
/******************************************************************************************/
/*механизмы в расценках*/ 
(SELECT 
	ssd.sm_id  				as sm_id1, 
	ssd1.sm_id 				as sm_id2,
	ssd2.sm_id 				as sm_id3,

	ssd.name  				as c1, 
	ssd1.name 				as c2,
	ssd2.name 				as c3,
	ssd.sm_number 				as c4,
	ssd1.sm_number 				as c5,
	ssd2.sm_number	 			as c6, 

	mch.MECH_CODE 				as c7, 
	UCASE(mch.MECH_NAME) 			as c8, 
	mch.MECH_UNIT				as c9,   
	round(sum(mch.MECH_COUNT),6) 		as c10 

 FROM smetasourcedata ssd
 INNER JOIN smetasourcedata ssd1 	ON ssd1.PARENT_ID = ssd.SM_ID  AND ssd1.SM_TYPE = 1 
 INNER JOIN smetasourcedata ssd2	ON ssd2.PARENT_ID = ssd1.SM_ID AND ssd2.SM_TYPE = 3  
 INNER JOIN data_estimate de 		ON de.ID_ESTIMATE = ssd2.SM_ID  
 INNER JOIN card_rate cr 		ON cr.ID = de.ID_TABLES 
 INNER JOIN mechanizmcard mch 		ON mch.ID_CARD_RATE = cr.ID 
 WHERE ssd.SM_ID = :SM_ID   
 group by sm_id3,MECH_CODE)


/******************************************************************************************/
UNION
/******************************************************************************************/
/*механизмы вне расценок*/ 
(SELECT 
	ssd.sm_id  			as sm_id1, 
	ssd1.sm_id 			as sm_id2,
	ssd2.sm_id 			as sm_id3,

	ssd.name  			as c1, 
	ssd1.name 			as c2,
	ssd2.name 			as c3,
	ssd.sm_number 			as c4,
	ssd1.sm_number 			as c5,
	ssd2.sm_number	 		as c6, 

	mch.MECH_CODE 			as c7, 
	UCASE(mch.MECH_NAME) 		as c8, 
	mch.MECH_UNIT			as c9,   
	round(sum(mch.MECH_COUNT),6)	as c10 

 FROM smetasourcedata ssd
 INNER JOIN smetasourcedata ssd1 	ON ssd1.PARENT_ID = ssd.SM_ID  	 AND ssd1.SM_TYPE = 1 
 INNER JOIN smetasourcedata ssd2	ON ssd2.PARENT_ID = ssd1.SM_ID   AND ssd2.SM_TYPE = 3  
 INNER JOIN data_estimate de 		ON de.ID_ESTIMATE = ssd2.SM_ID   and de.ID_TYPE_DATA 
INNER JOIN mechanizmcard mch 		ON mch.ID = de.ID_TABLES 	 AND mch.ID_CARD_RATE = 0
 WHERE ssd.SM_ID = :SM_ID   
 group by sm_id3,MECH_CODE)


/******************************************************************************************/
UNION
/******************************************************************************************/
/*затраты труда*/ 
(select 
	ssd.sm_id  						as sm_id1,
	ssd1.sm_id 						as sm_id2,
	ssd2.sm_id 						as sm_id3,

	ssd.name  						as c1,
	ssd1.name 						as c2,
	ssd2.name 						as c3,
	ssd.sm_number 						as c4,
	ssd1.sm_number 						as c5,
	ssd2.sm_number 						as c6,

	"1-1" 							as c7,  
	"ЗАТРАТЫ ТРУДА РАБОЧИХ-СТРОИТЕЛЕЙ" 			as c8, 
	"чел/ч" 						as c9,  
	round(sum(de.trud),6)					As c10
FROM smetasourcedata ssd
INNER JOIN smetasourcedata ssd1 ON ssd1.PARENT_ID = ssd.SM_ID  		AND ssd1.SM_TYPE = 1
INNER JOIN smetasourcedata ssd2 ON ssd2.PARENT_ID = ssd1.SM_ID 		AND ssd2.SM_TYPE = 3
INNER JOIN data_estimate de 	ON de.ID_ESTIMATE = ssd2.SM_ID     	
INNER JOIN card_rate cr 	ON cr.ID = de.ID_TABLES
WHERE ssd.SM_ID =:SM_ID     
group by ssd2.sm_id )
/******************************************************************************************/
UNION
/******************************************************************************************/
/*затраты труда*/ 
(select 
	ssd.sm_id  						as sm_id1,
	ssd1.sm_id 						as sm_id2,
	ssd2.sm_id 						as sm_id3,

	ssd.name  						as c1,
	ssd1.name 						as c2,
	ssd2.name 						as c3,
	ssd.sm_number 						as c4,
	ssd1.sm_number 						as c5,
	ssd2.sm_number 						as c6,

	"1-3" 							as c7,  
	"ЗАТРАТЫ ТРУДА МАШИНИСТОВ" 				as c8, 
	"чел/ч" 						as c9,  
	round(sum(de.trud_mash),6)				As c10
FROM smetasourcedata ssd
INNER JOIN smetasourcedata ssd1 ON ssd1.PARENT_ID = ssd.SM_ID  		AND ssd1.SM_TYPE = 1
INNER JOIN smetasourcedata ssd2 ON ssd2.PARENT_ID = ssd1.SM_ID 		AND ssd2.SM_TYPE = 3
INNER JOIN data_estimate de 	ON de.ID_ESTIMATE = ssd2.SM_ID     	
INNER JOIN card_rate cr 	ON cr.ID = de.ID_TABLES
WHERE ssd.SM_ID =:SM_ID     
group by ssd2.sm_id )
/******************************************************************************************/
UNION
/******************************************************************************************/
/*оборудование*/ 
(SELECT
	ssd.sm_id  			as sm_id1,
	ssd1.sm_id 			as sm_id2,
	ssd2.sm_id 			as sm_id3,

	ssd.name  			as c1,
	ssd1.name 			as c2,
	ssd2.name 			as c3,
	ssd.sm_number 			as c4,
	ssd1.sm_number 			as c5,
	ssd2.sm_number 			as c6,

	dc.DEVICE_CODE  		as c7,
	dc.DEVICE_NAME			as c8,
	round(sum(dc.DEVICE_COUNT),6)	as c9,
	dc.DEVICE_UNIT			as c10


FROM smetasourcedata ssd
INNER JOIN smetasourcedata ssd1 ON ssd1.PARENT_ID = ssd.SM_ID  		AND ssd1.SM_TYPE 	= 1
INNER JOIN smetasourcedata ssd2 ON ssd2.PARENT_ID = ssd1.SM_ID 		AND ssd2.SM_TYPE 	= 3
INNER JOIN data_estimate de 	ON de.ID_ESTIMATE = ssd2.SM_ID     	AND de.ID_TYPE_DATA 	= 4
INNER JOIN devicescard 	dc 	ON dc.ID = de.ID_TABLES
WHERE ssd.SM_ID =:SM_ID     
group by sm_id3,DEVICE_CODE)

)    CR_REZ ORDER BY sm_id2,sm_id3,c5,c6,c7 
