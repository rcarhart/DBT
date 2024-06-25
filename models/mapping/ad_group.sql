with ad_group as (
    select *
    from {{ ref('doner_bing_adgroups')}}

)

select * from ad_group