select * from {{ ref('covid_stats_per_municipality') }}
where cases_per_capita < 0