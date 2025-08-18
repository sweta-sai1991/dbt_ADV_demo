
-- Auto-generated Link: customer_customer_demo
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(customer_id as string) || '|' || cast(customer_type_id as string)) as customer_customer_demo_lk,
   customer_id, customer_type_id,
   current_timestamp() as load_date,
   'customer_customer_demo_raw' as record_source
from {{ source('bigquery_data', 'customer_customer_demo_raw') }}
{% endraw %}
