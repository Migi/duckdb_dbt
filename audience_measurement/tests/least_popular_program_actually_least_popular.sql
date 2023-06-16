select *
from {{ ref("agg_per_program") }} agg
join {{ ref("least_popular_program") }} lpp
  on agg.unique_id = lpp.unique_id
where lpp.total_time_minutes > agg.total_time_minutes
