
-- Auto-generated Satellite: customer_demographics
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(customer_type_id as string)) as customer_demographics_hk,
   customer_desc,
   current_timestamp() as load_date,
   'customer_demographics' as record_source
from {{ ref('customer_demographics') }}
{% endraw %}
