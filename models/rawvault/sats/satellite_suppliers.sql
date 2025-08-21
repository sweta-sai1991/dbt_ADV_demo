
-- Auto-generated Satellite: suppliers
{{ config(materialized='table') }}
select
   md5(cast(supplier_id as string)) as suppliers_hk,
   supplier_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, home_page,
   current_timestamp() as load_date,
   'suppliers' as record_source
from {{ source('bigquery', 'suppliers') }}
