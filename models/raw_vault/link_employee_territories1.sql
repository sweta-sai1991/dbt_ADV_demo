{%- set source_model = "stg_employee_territories"        -%}
{%- set src_pk = "EMPLOYEE_TERRITORY_PK"         -%}
{%- set src_fk = ["EMPLOYEE_PK", "TERRITORY_PK"] -%}
{%- set src_ldts = "LOAD_DATETIME"           -%}
{%- set src_source = "RECORD_SOURCE"         -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}