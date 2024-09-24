with source as (
      select * from {{ source('motherduck', 'arr_data') }}
),
renamed as (
    select
    period_start
    , period_end
    , customer_id
    , invoice_number
    , annualised_amt      

    from source
)
select * from renamed
--period_start
--2019-08-15 min 
--2023-07-14 max

--period_end
--
  