
-- Auto-generated Satellite: supplier
{{ config(materialized='table') }}
select
   md5(cast(supplier_id as string)) as supplier_hk,
   company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, home_page,
   current_timestamp() as load_date,
   'supplier' as record_source
from {{ source('bigquery', 'supplier') }}
