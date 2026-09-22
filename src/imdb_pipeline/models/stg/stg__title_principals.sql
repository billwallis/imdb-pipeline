select
    tconst,
    ordering::int as ordering,
    nconst,
    category,
    nullif(job, '\N') as job,
    nullif(characters, '\N')::json as characters,
from {{ source("imdb", "title.principals.tsv") }}
