
{%- set yaml_metadata -%}
source_model: "stg_employees"
src_pk: "EMPLOYEE_PK"
src_hashdiff: 
  source_column: "EMPLOYEE_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
      - "LAST_NAME"
      - "FIRST_NAME"
      - "TITLE"
      - "TITLE_OF_COURTESY"
      - "BIRTH_DATE"
      - "HIRE_DATE"
      - "ADDRESS"
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
src_eff: "LOAD_DATETIME"
src_ldts: "LOAD_DATETIME"
src_source: "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_eff=metadata_dict["src_eff"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"])   }}
