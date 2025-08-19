{{ config( materialized = 'view' ) }}

with customers_view as (

    select * from {{ ref ('satellite_customers')}}
),

latest_customer_view as (

    select *,
        ROW_NUMBER() OVER (PARTITION BY customers_hk ORDER BY load_date DESC) AS rn    
        from 
            customers_view
        
)


select * from latest_customer_view where rn = 1
