select
    titleId as title_id,
    ordering::int as ordering,
    title,
    nullif(region, '\N') as region,
    nullif("language", '\N') as "language",
    nullif(types, '\N') as types,
    nullif(attributes, '\N') as attributes,  /* TODO: handle the `STX` characters */
    isOriginalTitle::bool as is_original_title,
from {{ source("imdb", "title.akas.tsv") }}
