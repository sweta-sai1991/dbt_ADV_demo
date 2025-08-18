
-- Auto-generated Satellite: customers
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(customer_id as string)) as customers_hk,
   customer_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax,
   current_timestamp() as load_date,
   'customers_raw' as record_source
from {{ source('bigquery_data', 'customers_raw') }}
{% endraw %}
