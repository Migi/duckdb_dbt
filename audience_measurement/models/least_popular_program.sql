select * from {{ ref('agg_per_program') }}
order by total_time_minutes asc
limit 1