with bing_doner_parse as (
    Select
    [Campaign Name] as campaignname_platform,
    [Date],
    [Ad ID] as adid,
    [Ad Labels] as adname_platform,
    [Ad Group ID] as adgroupid,
    [Ad Group Name] as adgroupname_platform,
    [Campaign ID] as campaignid,
    PARSENAME(REPLACE([Data Source name], '|', '.'), 4) AS client, --parse data source to create client
    PARSENAME(REPLACE([Data Source Name], '|', '.'), 3) AS property, --parse data source to create property
    [Clicks] as clicks,
    [Impressions] as Impressions,
    [Spend (USD)] as cost,
    [Conversions] as conversions
    from {{ ref('union_sources_bing') }}
)
select * from bing_doner_parse