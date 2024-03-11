select
  nis5,
  {% for dose in dbt_utils.get_column_values(table = ref('stg_vacc_muni_cum'), column = 'dose') %}
  sum(case when dose = '{{ dose }}' then cumul else 0 end) as doses_{{ dose }}
  {% if not loop.last %},{% endif %}
  {% endfor %}
from {{ ref('stg_vacc_muni_cum') }}
group by 1
