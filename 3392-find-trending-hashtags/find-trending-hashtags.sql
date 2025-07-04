/* Write your PL/SQL query statement below */
WITH hashtags AS (
    SELECT 
        regexp_substr(tweet, '#\w+', 1, 1) AS hashtag,
        COUNT(*) AS hashtag_count
    FROM tweets
    WHERE TO_CHAR(tweet_date, 'YYYY-MM') = '2024-02'
    GROUP BY regexp_substr(tweet, '#\w+', 1, 1)
),
ranked_hashtags AS (
    SELECT 
        hashtag,
        hashtag_count,
        ROW_NUMBER() OVER (ORDER BY hashtag_count DESC, hashtag DESC) AS rnk
    FROM hashtags
)
SELECT 
    hashtag,
    hashtag_count
FROM ranked_hashtags
WHERE rnk <= 3;
