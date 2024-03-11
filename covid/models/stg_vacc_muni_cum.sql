select *
from {{ source('public', 'vacc_muni_cum') }}
