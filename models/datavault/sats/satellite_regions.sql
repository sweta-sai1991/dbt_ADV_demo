
-- Auto-generated Satellite: regions
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(region_id as string)) as regions_hk,
   region_description,
   current_timestamp() as load_date,
   'regions' as record_source
from {{ source('bigquery', 'regions') }}
{% endraw %}
