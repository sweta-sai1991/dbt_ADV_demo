
# Auto-generated Hub: products
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(product_id as string)) as products_hk,
   product_id,
   current_timestamp() as load_date,
   'products_raw' as record_source
from {{ source('bigquery_data', 'products_raw') }}
{% endraw %}
