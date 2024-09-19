with source as (
      select * from {{ source('motherduck', 'base_table') }}
),
renamed as (
    select
        {{ adapter.quote("date") }},
        {{ adapter.quote("week") }},
        {{ adapter.quote("month") }},
        {{ adapter.quote("week_beginning") }},
        {{ adapter.quote("week_ending") }},
        {{ adapter.quote("month_beginning") }},
        {{ adapter.quote("month_ending") }}

    from source
)
select * from renamed
  