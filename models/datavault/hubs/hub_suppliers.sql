
# Auto-generated Hub: supplier

{{ config(materialized='table') }}
select
   md5(cast(supplier_id as string)) as supplier_hk,
   supplier_id,
   current_timestamp() as load_date,
   'suppliers' as record_source
from {{ source('bigquery', 'suppliers') }}

