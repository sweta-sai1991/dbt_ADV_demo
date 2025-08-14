
-- Auto-generated Satellite: suppliers
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(supplier_id as string)) as suppliers_hk,
   company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, home_page,
   current_timestamp() as load_date,
   'suppliers' as record_source
from {{ ref('suppliers') }}
{% endraw %}
