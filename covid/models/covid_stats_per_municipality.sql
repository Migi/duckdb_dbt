with joined as (
  select
    cases.*,
    vaccination.fully_vaccinated,
    vaccination.by_date
  from {{ ref('cases_per_municipality') }} as cases
  left join {{ ref('vaccinations_per_municipality') }} as vaccination on cases.nis5 = vaccination.nis5
),
population_stat as (
  select
    joined.*,
    population.population
  from joined
  left join {{ source('public', 'population') }} on population.refnis = joined.nis5
),
final as (
  select
    *,
    new_cases / population as cases_per_capita,
    fully_vaccinated / population AS vacc_per_capita
  from population_stat
)
select * from final