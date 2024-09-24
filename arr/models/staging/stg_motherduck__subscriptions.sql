with source as (
      select * from {{ source('motherduck', 'subscriptions') }}
),
renamed as (
    select
        subscription_id
        , account_id
        , try_cast(subscription_start_date as datetime) subscription_start_date
        , try_cast(subscription_end_date as datetime) subscription_end_date
        , try_cast(trial_start_date as datetime) trial_start_date
        , try_cast(trial_end_date as datetime) trial_end_date
        , revenue


    from source
)
select * from renamed

--2021-01-01 min
--2024-01-07 max
  