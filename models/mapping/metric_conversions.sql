with metric_conversions as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_metric_conversions'),
            ref('doner_google_metric_conversions')
        ],
        source_column_name=None
    )
    }}
)

Select * from metric_conversions