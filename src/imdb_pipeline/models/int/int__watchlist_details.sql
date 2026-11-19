with

watchlist as (
    select
        seed_watchlist.title_id,
        stg__title_basics.title_type,
        list_contains(stg__title_basics.genres, 'Horror') as is_horror,
        format(
            '{:s} ({:d})',
            stg__title_basics.primary_title,
            stg__title_basics.start_year
        ) as title_name,
        stg__title_basics.genres,
        stg__title_ratings.average_rating,
        stg__title_ratings.num_votes,
        stg__title_crew.directors,
        stg__title_crew.writers,
        -- list_transform(
        --     stg__title_crew.directors,
        --     lambda id: (select primary_name from stg__name_basics where nconst = id)
        -- ) as directors,
        -- list_transform(
        --     stg__title_crew.writers,
        --     lambda id: (select primary_name from stg__name_basics where nconst = id)
        -- ) as writers,
    from seed_watchlist
        inner join stg__title_basics
            on seed_watchlist.title_id = stg__title_basics.tconst
        inner join stg__title_ratings
            on seed_watchlist.title_id = stg__title_ratings.tconst
        inner join stg__title_crew
            on seed_watchlist.title_id = stg__title_crew.tconst
    where not seed_watchlist.watched
)

select
    title_id,
    title_type,
    is_horror,
    title_name,
    genres,
    average_rating,
    -- num_votes,
    directors,
    writers,
from watchlist
order by
    title_type,
    is_horror desc,
    title_id
