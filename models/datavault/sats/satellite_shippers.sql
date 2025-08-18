
-- Auto-generated Satellite: shippers
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(shipper_id as string)) as shippers_hk,
   company_name, phone,
   current_timestamp() as load_date,
   'shippers_raw' as record_source
from {{ source('bigquery_data', 'shippers_raw') }}
{% endraw %}
