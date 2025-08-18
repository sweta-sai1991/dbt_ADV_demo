
-- Auto-generated Link: employees_territories
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(employee_id as string) || '|' || cast(territory_id as string)) as employees_territories_lk,
   employee_id, territory_id,
   current_timestamp() as load_date,
   'employees_territories' as record_source
from {{ source('bigquery', 'employees_territories') }}
{% endraw %}
