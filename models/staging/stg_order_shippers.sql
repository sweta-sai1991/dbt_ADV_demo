{%- set yaml_metadata -%}
source_model: "pstg_order_shippers"
derived_columns:
  RECORD_SOURCE: "!JOIN_BQ_ORDER_SHIPPER"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  ORDER_PK: "order_id"
  SHIPPER_PK: "shipper_id"
  ORDER_SHIPPER_PK:
    - "order_id"
    - "shipper_id"
    
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}