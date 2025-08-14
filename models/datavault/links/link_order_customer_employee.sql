
-- Auto-generated Link: order_customer_employee
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(order_id as string) || '|' || cast(customer_id as string) || '|' || cast(employee_id as string)) as order_customer_employee_lk,
   order_id, customer_id, employee_id,
   current_timestamp() as load_date,
   'orders' as record_source
from {{ ref('orders') }}
{% endraw %}
