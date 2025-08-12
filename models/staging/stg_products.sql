{%- set yaml_metadata -%}
source_model: "pstg_products"
derived_columns:
  RECORD_SOURCE: "!BQ_PRODUCTS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  PRODUCT_PK: "product_id"
  PRODUCT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "product_name"
      - "supplier_id"
      - "category_id"
      - "quantity_per_unit"
      - "unit_price"
      - "units_in_stock"
      - "units_on_order"
      - "reorder_level"
      - "discontinued"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
