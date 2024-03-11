with muni_vacc_with_dates as (
  select
    *,
    (
      date_trunc('week', strptime(CONCAT('20', substring(year_week, 1, 2) ), '%Y'))
      + interval (cast(substring(year_week, 4, 2) as integer)) week
    ) AS last_day_of_the_week
  from {{ source('public', 'vacc_muni_cum') }}
),
vaccinations as (
  select
    nis5,
    sum(cumul) as fully_vaccinated,
    date '2021-08-10' as by_date,
    last_day_of_the_week
  from muni_vacc_with_dates
  where (dose='B' or dose='C' or dose='E')
  group by nis5, last_day_of_the_week
  having last_day_of_the_week >= by_date
     and last_day_of_the_week < by_date + interval 1 week
)
select * from vaccinations
