
-- Auto-generated Hub: employees
{{ config(materialized='table') }}
select
   md5(cast(employee_id as string)) as employees_hk,
   employee_id,
   current_timestamp() as load_date,
   'employees' as record_source
from {{ source('bigquery', 'employees') }}
