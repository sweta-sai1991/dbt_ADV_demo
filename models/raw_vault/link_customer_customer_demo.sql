{%- set source_model = "stg_customer_customer_demo"        -%}
{%- set src_pk = "CUSTOMER_CUSTOMER_DEMO_PK"         -%}
{%- set src_fk = ["CUSTOMER_PK", "CUSTOMER_TYPE_PK"] -%}
{%- set src_ldts = "LOAD_DATETIME"           -%}
{%- set src_source = "RECORD_SOURCE"         -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}