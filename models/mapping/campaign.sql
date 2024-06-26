with campaigns as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_campaigns'),
            ref('doner_google_campaign')
        ],
        source_column_name=None
    )}}
)

select * from campaigns

