with arr as (
    select * from {{ ref("base_motherduck_arr_data")}}
)

, subscriptions as (
    select * from {{ ref("stg_motherduck__subscriptions")}}
)

, clean_data as (
    select 
    period_start
    , period_end
    , customer_id
    , invoice_number
    , annualised_amt
    , subscription_id
    , account_id
    , subscription_start_date
    , subscription_end_date
    from arr as a 
    left join subscriptions as s 
    on cast(a.period_start as date) 
    BETWEEN s.subscription_start_date AND a.period_end
)

select * from clean_data