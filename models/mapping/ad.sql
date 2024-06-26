with ad_cte as (
  {{dbt_utils.union_relations(
    relations=[
      ref('doner_google_ad'),
      ref('doner_bing_ads')
    ],
    source_column_name=None
  )
    }}
)
Select * from ad_cte