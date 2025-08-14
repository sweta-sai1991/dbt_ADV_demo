
-- Auto-generated Satellite: order_details
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(order_id as string)) as order_details_hk,
   product_id, unit_price, quantity, discount,
   current_timestamp() as load_date,
   'order_details' as record_source
from {{ ref('order_details') }}
{% endraw %}
