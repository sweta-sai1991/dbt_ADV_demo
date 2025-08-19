
-- Auto-generated Satellite: shippers
{{ config(materialized='table') }}
select
   md5(cast(shipper_id as string)) as shippers_hk,
   company_name, phone,
   current_timestamp() as load_date,
   'shippers' as record_source
from {{ source('bigquery', 'shippers') }}
