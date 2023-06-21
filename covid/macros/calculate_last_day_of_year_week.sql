{% macro calculate_last_day_of_year_week(column_name) %}
DATEADD( week, substring({{ column_name }}, 4, 2) - 1 , LAST_DAY(TO_DATE(CONCAT('20', substring({{ column_name }}, 1, 2) ), 'YYYY'), week) ) AS last_day_of_the_week
{% endmacro %}
