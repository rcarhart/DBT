{{
    config(
        materialized='incremental',
        unique_key=['campaignid','platform']
        )
}}

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
{% if is_incremental()%}
    where load_date >= (select max(load_date) from {{ this }})
{% endif %}

