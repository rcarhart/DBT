with adgroup_attributes as (
    select *
    from {{ ref('doner_bing_ad_attributes')}}
    )

select * from adgroup_attributes