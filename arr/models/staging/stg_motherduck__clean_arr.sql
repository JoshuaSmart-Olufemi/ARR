with source as (
      select * from {{ source('motherduck', 'clean_arr_') }}
),
renamed as (
    select
      cast(period_start as datetime)
      , cast(period_end as datetime)
      , cast(customer_id as text)
      , cast(invoice_id as text)
      , cast(subscription_id as text)
      , cast(invoice_number as text)
      , annualised_amt 
    from source
)
select * from renamed
  