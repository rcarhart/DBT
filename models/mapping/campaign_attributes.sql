with campaign_attributes as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_campaign_attributes'),
            ref('doner_google_campaign_attributes')
        ],
        source_column_name=None
    )
    }}
)

select * from campaign_attributes