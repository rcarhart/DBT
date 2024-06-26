with ad_group as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_adgroups'),
            ref('doner_google_adgroups')
        ],
        source_column_name=None
    )
    }}
)

select * from ad_group