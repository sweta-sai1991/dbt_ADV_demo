
# Auto-generated Hub: regions
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(region_id as string)) as regions_hk,
   region_id,
   current_timestamp() as load_date,
   'regions_raw' as record_source
from {{ source('bigquery_data', 'regions_raw') }}
{% endraw %}
