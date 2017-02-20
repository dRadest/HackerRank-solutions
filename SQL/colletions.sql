SELECT Doctor,Professor, Singer, Actor FROM 
( 
SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rn,
name, occupation FROM occupations ) 
PIVOT 
( 
MAX(name) 
FOR occupation IN ('Doctor' AS Doctor ,'Professor' AS Professor,
'Singer' AS Singer ,'Actor' AS Actor) 
)
ORDER BY rn;
