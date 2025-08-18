
# Auto-generated Hub: supplier
{% raw %}
{{ config(materialized='table') }}
select
   md5(cast(supplier_id as string)) as supplier_hk,
   supplier_id,
   current_timestamp() as load_date,
   'supplier' as record_source
from {{ source('bigquery', 'supplier') }}
{% endraw %}
