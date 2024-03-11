echo "Generating tpch dataset..."
duckdb /tmp/tpch.duckdb "install tpch; load tpch; call dbgen(sf=1);"
