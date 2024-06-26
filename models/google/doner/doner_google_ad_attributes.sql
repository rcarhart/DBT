with ad_attributes as (
    select
        adgroupid,
        adid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_ad') }}
)

select * from ad_attributes