/* Write your PL/SQL query statement below */
WITH answerCount AS (
    SELECT question_id, COUNT(*) OVER (PARTITION BY question_id) AS answerCnt
    FROM SurveyLog 
    WHERE action = 'answer'
),
showCount AS (
    SELECT question_id, COUNT(*) OVER (PARTITION BY question_id) AS showCnt
    FROM SurveyLog 
    WHERE action = 'show'
),
answerRate AS (
    SELECT 
        a.question_id, 
        a.answerCnt * 1.0 / s.showCnt AS ansRate
    FROM answerCount a
    JOIN showCount s ON a.question_id = s.question_id
)
select * from (SELECT question_id AS survey_log 
FROM answerRate 
ORDER BY ansRate DESC, question_id) where rownum = 1;
