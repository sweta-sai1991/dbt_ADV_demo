{%- set yaml_metadata -%}
source_model: "pstg_regions"
derived_columns:
  RECORD_SOURCE: "!BQ_REGIONS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  REGION_PK: "region_id"
  REGION_HASHDIFF:
    is_hashdiff: true
    columns:
      - "region_description"


{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
