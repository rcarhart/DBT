{{
  config(
    materialized = 'incremental',
    unique_key = ['adid', 'adgroupid','platform', 'client', 'property']
    )
}}

with ad_attributes as (
    {{dbt_utils.union_relations(
        relations=[
            ref('doner_bing_ad_attributes'),
            ref('doner_google_ad_attributes')
        ],
        source_column_name=None
    )
    }}
)

select * from ad_attributes
{% if is_incremental()%}
    where load_date >= (select max(load_date) from {{ this }})
{% endif %}
