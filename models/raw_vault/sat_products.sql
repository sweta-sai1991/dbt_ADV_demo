
{%- set yaml_metadata -%}
source_model: "stg_products"
src_pk: "PRODUCT_PK"
src_hashdiff: 
  source_column: "PRODUCT_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
      - "product_name"
      - "supplier_id"
      - "category_id"
      - "quantity_per_unit"
      - "unit_price"
      - "units_in_stock"
      - "units_on_order"
      - "reorder_level"
      - "discontinued"
      
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
