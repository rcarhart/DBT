with source_union as (
  {{ dbt_utils.union_relations(
      relations=[
        source('GoogleSheets', 'DigitalData_AHA_Bing'),
        source('GoogleSheets', 'DigitalData_WorldStrides_Bing'),
        source('GoogleSheets', 'DigitalData_Motive_Bing')
      ]
  ) }}
),

--rename fields,split data source field, create platform field
renamed_fields_cte as (
  select
    [Campaign Name] as campaignname_platform,
    [Date] as date,
    [Ad ID] as adid,
    [Ad Labels] as adname_platform,
    [Ad Group ID] as adgroupid,
    [Ad Group Name] as adgroupname_platform,
    [Campaign ID] as campaignid,
    PARSENAME(REPLACE([Data Source Name], '|', '.'), 4) as client, --parse data source to create client
    PARSENAME(REPLACE([Data Source Name], '|', '.'), 3) as property, --parse data source to create property
    [Clicks] as clicks,
    [Impressions] as impressions,
    [Spend (USD)] as cost,
    [Conversions] as conversions,
    'Bing' as platform
  from source_union
),

--trim fields and create null data if no data exists in the field
null_data_cte as(
  select
  {{ trim_and_null(['campaignname_platform','adname_platform', 'date', 'adid','adgroupid','adgroupname_platform','campaignid','client','property','clicks','impressions','cost','conversions','platform'])}}
  from renamed_fields_cte
)
Select * from null_data_cte