select
    tconst,
    parentTconst,
    nullif(seasonNumber, '\N')::int as season_number,
    nullif(episodeNumber, '\N')::int as episode_number,
from {{ source("imdb", "title.episode.tsv") }}
