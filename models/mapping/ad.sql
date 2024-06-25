with ad_cte as (
    Select *
    from {{ref('doner_bing_ads')}}
)
Select * from ad_cte