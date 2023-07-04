{% snapshot country_codes_snapshot %}

{{
    config(
      target_database='academy_dbt',
      target_schema=target.schema,
      unique_key='country_code',

      strategy='check',
      check_cols=['country_name', 'continent'],
    )
}}

select * from {{ ref('country_codes') }}

{% endsnapshot %}
