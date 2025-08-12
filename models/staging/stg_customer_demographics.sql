{%- set yaml_metadata -%}
source_model: "pstg_customer_demographics"
derived_columns:
  RECORD_SOURCE: "!BQ_CUSTOMER_DEMOGRAPHICS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  CUSTOMER_DEMOGRAPHICS_PK: "customer_type_id"
  CUSTOMER_DEMO_HASHDIFF:
    is_hashdiff: true
    columns:
      - "customer_desc"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}