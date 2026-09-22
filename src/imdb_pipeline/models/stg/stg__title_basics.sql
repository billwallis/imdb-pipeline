select
    tconst,
    titleType as title_type,
    primaryTitle as primary_title,
    originalTitle as original_title,
    isAdult::bool as is_adult,
    nullif(startYear, '\N')::int as start_year,
    nullif(endYear, '\N')::int as end_year,
    nullif(runtimeMinutes, '\N')::int as runtime_minutes,
    split(genres, ',') as genres,
from {{ source("imdb", "title.basics.tsv") }}
