
# Auto-generated Hub: customer_demographics
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(customer_type_id as string)) as customer_demographics_hk,
   customer_type_id,
   current_timestamp() as load_date,
   'customer_demographics_raw' as record_source
from {{ source('bigquery_data', 'customer_demographics_raw') }}
{% endraw %}
