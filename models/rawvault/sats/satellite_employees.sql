
-- Auto-generated Satellite: employees
{{ config(materialized='table') }}
select
   md5(cast(employee_id as string)) as employees_hk,
   employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension, photo, notes, reports_to, photo_path,
   current_timestamp() as load_date,
   'employees' as record_source
from {{ source('bigquery', 'employees') }}
