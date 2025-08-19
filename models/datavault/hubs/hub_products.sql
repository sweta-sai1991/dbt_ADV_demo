
# Auto-generated Hub: products

{{ config(materialized='table') }}
select
   md5(cast(product_id as string)) as products_hk,
   product_id,
   current_timestamp() as load_date,
   'products' as record_source
from {{ source('bigquery', 'products') }}

