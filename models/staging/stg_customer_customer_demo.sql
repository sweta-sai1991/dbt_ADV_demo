{%- set yaml_metadata -%}
source_model: "pstg_customer_customer_demo"
derived_columns:
  RECORD_SOURCE: "!BQ_CUSTOMER_CUSTOMER_DEMO"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  CUSTOMER_PK: "customer_id"
  CUSTOMER_TYPE_PK: "customer_type_id"
  CUSTOMER_CUSTOMER_DEMO_PK:
    - "customer_id"
    - "customer_type_id"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}