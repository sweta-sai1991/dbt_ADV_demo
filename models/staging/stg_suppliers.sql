{%- set yaml_metadata -%}
source_model: "pstg_suppliers"
derived_columns:
  RECORD_SOURCE: "!BQ_SUPPLIERS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  SUPPLIER_PK: "supplier_id"
  SUPPLIER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "company_name"
      - "contact_name"
      - "contact_title"
      - "address"
      - "city"
      - "region"
      - "postal_code"
      - "country"
      - "phone"
      - "fax"
      - "home_page"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
