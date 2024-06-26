with adgroup_attributes as (
    select
        adgroupid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_adgroups') }}
    )

select * from adgroup_attributes