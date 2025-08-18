
-- Auto-generated Satellite: categories
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(category_id as string)) as categories_hk,
   category_name, description, picture,
   current_timestamp() as load_date,
   'categories' as record_source
from {{ source('bigquery', 'categories') }}
{% endraw %}
