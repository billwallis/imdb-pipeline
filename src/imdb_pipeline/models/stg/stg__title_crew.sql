select
    tconst,
    split(nullif(directors, '\N'), ',') as directors,
    split(nullif(writers, '\N'), ',') as writers,
from {{ source("imdb", "title.crew.tsv") }}
