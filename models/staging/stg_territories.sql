{%- set yaml_metadata -%}
source_model: "pstg_territories"
derived_columns:
  RECORD_SOURCE: "!BQ_TERRITORIES"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  TERRITORY_PK: "territory_id"
  TERRITORY_HASHDIFF:
    is_hashdiff: true
    columns:
      - "territory_description"
      - "region_id"


{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
