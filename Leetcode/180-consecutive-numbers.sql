SELECT DISTINCT num AS ConsecutiveNums FROM (
    SELECT num,
    LEAD(num,1) OVER() next_row1_of_num,
    LEAD(num,2) OVER() next_row2_of_num
    FROM Logs
) q
WHERE num=next_row1_of_num AND num=next_row2_of_num;