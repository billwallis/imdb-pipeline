select
    tconst,
    averageRating::decimal(6, 2) as average_rating,
    numVotes::int as num_votes,
from {{ source("imdb", "title.ratings.tsv") }}
