
-- Auto-generated Satellite: territories
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(territory_id as string)) as territories_hk,
   territory_description, region_id,
   current_timestamp() as load_date,
   'territories_raw' as record_source
from {{ source('bigquery_data', 'territories_raw') }}
{% endraw %}
