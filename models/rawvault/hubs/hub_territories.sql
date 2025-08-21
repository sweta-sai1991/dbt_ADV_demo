
-- Auto-generated Hub: territories
{{ config(materialized='table') }}
select
   md5(cast(territory_id as string)) as territories_hk,
   territory_id,
   current_timestamp() as load_date,
   'territories' as record_source
from {{ source('bigquery', 'territories') }}
