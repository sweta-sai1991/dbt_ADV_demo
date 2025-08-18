
# Auto-generated Hub: orders
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(order_id as string)) as orders_hk,
   order_id,
   current_timestamp() as load_date,
   'orders_raw' as record_source
from {{ source('bigquery_data', 'orders_raw') }}
{% endraw %}
