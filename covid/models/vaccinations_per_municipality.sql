with muni_vacc_with_dates as (
  select
    *,
    {{ calculate_last_day_of_year_week('year_week') }}
  from {{ source('public', 'vacc_muni_cum') }}
),
vaccinations as (
  select
    nis5,
    sum(cumul) as fully_vaccinated,
    date '{{ var("date") }}' as by_date,
    last_day_of_the_week
  from muni_vacc_with_dates
  where (dose='B' or dose='C' or dose='E')
  group by nis5, last_day_of_the_week
  having last_day_of_the_week >= by_date
     and last_day_of_the_week < by_date + interval 1 week
)
select * from vaccinations
