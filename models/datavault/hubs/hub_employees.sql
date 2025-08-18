
# Auto-generated Hub: employees
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(employee_id as string)) as employees_hk,
   employee_id,
   current_timestamp() as load_date,
   'employees_raw' as record_source
from {{ source('bigquery_data', 'employees_raw') }}
{% endraw %}
