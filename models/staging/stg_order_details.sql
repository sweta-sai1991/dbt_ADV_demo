{%- set yaml_metadata -%}
source_model: "pstg_order_details"
derived_columns:
  RECORD_SOURCE: "!BQ_ORDER_DETAILS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  ORDER_DETAIL_PK: "order_id"
  PRODUCT_PK: "product_id"
  ORDER_PRODUCT_PK: 
    - "order_id"
    - "product_id"
  ORDER_DETAIL_HASHDIFF:
    is_hashdiff: true
    columns:
      - "unit_price"
      - "quantity"
      - "discount"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
