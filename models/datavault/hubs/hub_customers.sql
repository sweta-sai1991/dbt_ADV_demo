
# Auto-generated Hub: customers

{{ config(materialized='table') }}
select
   md5(cast(customer_id as string)) as customers_hk,
   customer_id,
   current_timestamp() as load_date,
   'customers' as record_source
from {{ source('bigquery', 'customers') }}

