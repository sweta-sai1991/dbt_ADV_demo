
# Auto-generated Hub: shippers
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(shipper_id as string)) as shippers_hk,
   shipper_id,
   current_timestamp() as load_date,
   'shippers' as record_source
from {{ source('bigquery', 'shippers') }}
{% endraw %}
