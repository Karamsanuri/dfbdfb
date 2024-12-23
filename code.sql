-- This query shows a list of the daily top Google Search terms.
SELECT
   refresh_date AS Day,
   term AS Top_Term,
       -- These search terms are in the top 25 in the US each day.
   rank,
FROM `bigquery-public-data.google_trends.international_top_terms` 
WHERE 
   rank = 1 OR rank = 2 OR rank = 3
       -- Choose only the top 3 term each day.
       --Change the interval to lasat month 
   AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 WEEK)
       -- Filter to the last 4 WEEK.
       --Added region UK
    AND region_name = 'UK'
    --Group by week
GROUP BY Day, Top_Term, rank, week
ORDER BY Day DESC

   -- Show the days in reverse chronological order.
