select
  nation.n_name as "nation",
  avg(customer.c_acctbal) as "average_balance"
from {{ ref('nation') }} nation
join {{ ref('customer') }} customer on nation.n_nationkey = customer.c_nationkey
group by 1