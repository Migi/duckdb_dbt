with cases_with_year_week as (
  select
    *,
    CONCAT( SUBSTRING(cast(date_part('year', date_of_case) as varchar), 3, 2), 'W', cast(date_part('week', date_of_case) as varchar)) as year_week
  from {{ source('public', 'cases_muni') }}
),
new_cases_next_eight_weeks as (
  select
    nis5,
    TX_DESCR_NL,
    TX_DESCR_FR,
    TX_ADM_DSTR_DESCR_NL,
    TX_ADM_DSTR_DESCR_FR,
    PROVINCE,
    REGION,
    sum(cases) as new_cases,
    date '{{ var("date") }}' + interval 0 week as from_date,
    date '{{ var("date") }}' + interval 8 week as to_date
  from cases_with_year_week
  where date_of_case > from_date and date_of_case < to_date
  group by nis5, TX_DESCR_NL, TX_DESCR_FR, TX_ADM_DSTR_DESCR_NL, TX_ADM_DSTR_DESCR_FR, PROVINCE, REGION
)
select * from new_cases_next_eight_weeks
