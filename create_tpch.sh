echo "Creating tpch.duckdb database..."
duckdb /tmp/tpch.duckdb "install tpch; load tpch; call dbgen(sf=1);"
