
# Auto-generated Hub: categories

{{ config(materialized='table') }}
select
   md5(cast(category_id as string)) as categories_hk,
   category_id,
   current_timestamp() as load_date,
   'categories' as record_source
from {{ source('bigquery', 'categories') }}

