{%- set yaml_metadata -%}
source_model: "pstg_employees"
derived_columns:
  RECORD_SOURCE: "!BQ_EMPLOYEES"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  EMPLOYEE_PK: "employee_id"
  EMPLOYEE_HASHDIFF:
    is_hashdiff: true
    columns:
      - "last_name"
      - "first_name"
      - "title"
      - "title_of_courtesy"
      - "birth_date"
      - "hire_date"
      - "address"
      - "city"
      - "region"
      - "postal_code"
      - "country"
      - "home_phone"
      - "extension"
      - "photo"
      - "notes"
      - "reports_to"
      - "photo_path"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
