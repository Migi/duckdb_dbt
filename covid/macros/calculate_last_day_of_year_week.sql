{% macro calculate_last_day_of_year_week(column_name) %}
(
    date_trunc('week', strptime(CONCAT('20', substring({{ column_name }}, 1, 2) ), '%Y'))
    + interval (cast(substring({{ column_name }}, 4, 2) as integer)) week
) AS last_day_of_the_week
{% endmacro %}
