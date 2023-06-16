with least_popular_program_rowcount as (
    select count(*) as rowcnt from {{ ref("least_popular_program") }}
)
select * from least_popular_program_rowcount
where rowcnt <> 1
