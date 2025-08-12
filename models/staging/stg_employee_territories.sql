{%- set yaml_metadata -%}
source_model: "pstg_employees_territories"
derived_columns:
  RECORD_SOURCE: "!BQ_EMPLOYEE_TERRITORIES"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  EMPLOYEE_PK: "employee_id"
  TERRITORY_PK: "territory_id"
  EMPLOYEE_TERRITORY_PK:
    - "employee_id"
    - "territory_id"
    
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}