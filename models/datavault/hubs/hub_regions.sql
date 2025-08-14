
# Auto-generated Hub: regions
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(region_id as string)) as regions_hk,
   region_id,
   current_timestamp() as load_date,
   'regions' as record_source
from {{ ref('regions') }}
{% endraw %}
