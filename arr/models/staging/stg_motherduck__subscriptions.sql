with source as (
      select * from {{ source('motherduck', 'subscriptions') }}
),
renamed as (
    select
        subscription_id
        , account_id
        , try_cast(subscription_start_date as date) subscription_start_date
        , try_cast(subscription_end_date as date) subscription_end_date
        , try_cast(trial_start_date as datetime) trial_start_date
        , try_cast(trial_end_date as datetime) trial_end_date
        , revenue


    from source
)
select * from renamed
  