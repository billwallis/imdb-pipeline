select
    tconst,
    list_sort(split(nullif(directors, '\N'), ',')) as directors,
    list_sort(split(nullif(writers, '\N'), ',')) as writers,
from {{ source("imdb", "title.crew.tsv") }}
