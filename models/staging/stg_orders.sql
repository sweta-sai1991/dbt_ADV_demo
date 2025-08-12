{%- set yaml_metadata -%}
source_model: "pstg_orders"
derived_columns:
  RECORD_SOURCE: "!BQ_ORDERS"
  LOAD_DATETIME: CURRENT_TIMESTAMP()
hashed_columns:
  ORDER_PK: "order_id"
  CUSTOMER_PK: "customer_id"
  EMPLOYEE_PK: "employee_id"
  ORDER_CUSTOMER_EMPLOYEE_PK:
    - "order_id"
    - "customer_id"
    - "employee_id"
  ORDER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "order_date"
      - "required_date"
      - "shipped_date"
      - "ship_via"
      - "freight"
      - "ship_name"
      - "ship_city"
      - "ship_region"
      - "ship_postal_code"
      - "ship_country"
 
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
