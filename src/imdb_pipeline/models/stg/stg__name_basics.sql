select
    nconst,
    primaryName as primary_name,
    nullif(birthYear, '\N')::int as birth_year,
    nullif(deathYear, '\N')::int as death_year,
    split(primaryProfession, ',') as primary_profession,
    split(knownForTitles, ',') as known_for_titles,
from {{ source("imdb", "name.basics.tsv") }}
