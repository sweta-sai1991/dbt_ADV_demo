{%- set yaml_metadata -%}
source_model: "pstg_shippers"
derived_columns:
  RECORD_SOURCE: "!BQ_SHIPPERS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  SHIPPER_PK: "shipper_id"
  SHIPPER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "company_name"
      - "phone"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
