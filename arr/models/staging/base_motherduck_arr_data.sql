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
  