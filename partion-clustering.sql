

select _PARTITIONTIME as pt, _PARTITIONDATE as pd, name from `data-engineering-451818.partition_clustering.name_ingestion_partition`;

select * from `data-engineering-451818.partition_clustering.partition_date`;



#standardSQL
#create a table qui contient une partition et clustering a partir d'une autre dataset avec le condition :: creation_date BETWEEN '2018-01-01' AND '2019-01-01'
CREATE OR REPLACE TABLE `data-engineering-451818.partition_clustering.questions_2018_clustered`
PARTITION BY
  DATE(creation_date)
CLUSTER BY
  tags AS
SELECT
  id, title, accepted_answer_id, creation_date, answer_count , comment_count , favorite_count, view_count, tags
FROM
  `bigquery-public-data.stackoverflow.posts_questions`
WHERE
  creation_date BETWEEN '2018-01-01' AND '2019-01-01';


