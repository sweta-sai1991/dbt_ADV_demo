
{%- set yaml_metadata -%}
source_model: "stg_orders"
src_pk: "ORDER_PK"
src_hashdiff: 
  source_column: "ORDER_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
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
