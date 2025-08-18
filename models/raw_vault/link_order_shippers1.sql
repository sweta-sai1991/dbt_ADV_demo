{%- set source_model = "stg_order_shippers"        -%}
{%- set src_pk = "ORDER_SHIPPER_PK"         -%}
{%- set src_fk = ["ORDER_PK", "SHIPPER_PK"] -%}
{%- set src_ldts = "LOAD_DATETIME"           -%}
{%- set src_source = "RECORD_SOURCE"         -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}