SELECT score,DENSE_RANK() OVER
     (ORDER BY s.score DESC)  as `rank`
    FROM Scores s
ORDER BY score DESC
;