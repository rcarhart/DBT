with metrics_paid as (
    select *
    from {{ ref('doner_bing_metrics_paid') }}
)
select * from metrics_paid
