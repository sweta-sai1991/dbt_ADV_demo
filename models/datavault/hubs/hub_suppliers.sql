
# Auto-generated Hub: suppliers
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(supplier_id as string)) as suppliers_hk,
   supplier_id,
   current_timestamp() as load_date,
   'suppliers' as record_source
from {{ ref('suppliers') }}
{% endraw %}
