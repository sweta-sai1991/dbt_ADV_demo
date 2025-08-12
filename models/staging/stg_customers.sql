{%- set yaml_metadata -%}
source_model: "pstg_customers"
derived_columns:
  RECORD_SOURCE: "!BQ_CUSTOMERS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  CUSTOMER_PK: "customer_id"
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "customer_name"
      - "contact_name"
      - "contact_title"
      - "address"
      - "city"
      - "region"
      - "postal_code"
      - "country"
      - "phone"
      - "fax"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
