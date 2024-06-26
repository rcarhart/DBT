with metrics_paid as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_metrics_paid'),
            ref('doner_google_metrics_paid')
        ],
        source_column_name=None
    )}}
)
select * from metrics_paid
