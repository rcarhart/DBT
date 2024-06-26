with adgroup_attributes as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_adgroup_attributes'),
            ref('doner_google_adgroup_attributes')
        ],
        source_column_name=None
    )
        }}
    )

select * from adgroup_attributes