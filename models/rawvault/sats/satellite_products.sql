
-- Auto-generated Satellite: products
{{ config(materialized='table') }}
select
   md5(cast(product_id as string)) as products_hk,
   product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued,
   current_timestamp() as load_date,
   'products' as record_source
from {{ source('bigquery', 'products') }}
