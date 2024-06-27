with source_union_cte as(
{{ dbt_utils.union_relations(

    relations=[source('GoogleSheets', 'DigitalData_AHA_Google'),
    source('GoogleSheets','DigitalData_DetroitZoo_Google'),
    source('GoogleSheets','DigitalData_HungryHowies_Google LDSM'),
    source('GoogleSheets','DigitalData_HungryHowies_Google Blitz'),
    source('GoogleSheets','DigitalData_HungryHowies_Google Mature Markets'),
    source('GoogleSheets','DigitalData_Motive_Google'),
    source('GoogleSheets','DigitalData_Sprayway_Google'),
    source('GoogleSheets','DigitalData_WorldStrides_Google'),
    source('GoogleSheets','DigitalData_Prophet_Google'),
    ])
}}
),

doner_parse_cte as (
    select
        [Date] as date,
        -- case statement to create PMAX off of ad group id
        case
            when len(trim([Ad Group ID])) = 0 and [Campaign Type] = 'PERFORMANCE_MAX'
                then concat([Campaign ID],'_PMAX')
            else [Ad Group ID]
        end as adgroupid,
        --case statement to create PMAX off of ad group name
        case
            when len(trim([Ad Group Name]))=0 and [Campaign Type]='PERFORMANCE_MAX'
                then concat([Campaign],'PMAX')
            else [Ad Group Name]
        end as adgroupname_platform,
        -- case statement to create PMAX off of ad id
        case
            when len(trim([Ad ID]))=0 and [Campaign Type]= 'PERFORMANCE_MAX'
                then concat([Campaign ID], '_PMAX')
            else [Ad ID]
        end as adid,
        -- case statement to create adname_platform
        case
            when len(trim([Ad Labels])) > 0
                then [Ad Labels]
            when len(trim([Ad Name])) > 0
                then [Ad Name]
            else NULL
        end AS adname_platform,
        [Ad Type] as adtype,
        [Campaign] as campaignname_platform,
        [Campaign ID] as campaignid,
        [Campaign Type] as campaigntype,
        --case statement to create conversion type
        case
            when len([GoogleAds_Paid_ConversionName]) > 0
                then [GoogleAds_Paid_ConversionName]
            when len([GoogleAds_Paid_ConversionName]) = 0
                then NULL
        end as conversiontype,
        cast([Clicks] as float) as clicks,
        cast([Cost (USD)] as float) as cost,
        cast([Impressions] as float) as impressions,
        cast([Video Played To 100%] as float) as video100percent,
        cast([Video Played To 25%] as float) as video25percent,
        cast([Video Played To 50%] as float)as video50percent,
        cast([Video Played To 75%] as float) as video75percent,
        GoogleAds_Paid_Conversions,
        [Views (100%)],
        [Views (25%)],
        [Views (50%)],
        [Views (75%)],
        PARSENAME(REPLACE([Data Source name], '|', '.'), 4) AS client, --parse data source to create client
        PARSENAME(REPLACE([Data Source Name], '|', '.'), 3) AS property, --parse data source to create property
        Conversions,
        [Ad Final Urls] as ad_final_urls
    from source_union_cte
),

doner_parse_cont_cte as (
    select
        [date],
        adgroupid,
        adgroupname_platform,
        adid,
        adtype,
        campaignname_platform,
        campaignid,
        campaigntype,
        case
            when len(trim([conversiontype])) = 0 then NULL
            else conversiontype
        end as conversiontype,
        clicks,
        cost,
        impressions,
        video100percent,
        video25percent,
        video50percent,
        video75percent,
        GoogleAds_Paid_Conversions,
        [Views (100%)],
        [Views (25%)],
        [Views (50%)],
        [Views (75%)],
        client,
        property,
        Conversions,
        ad_final_urls,
        'GoogleAds' as platform,
        case
            when len(trim([adname_platform])) = 0 and [campaigntype] = 'PERFORMANCE_MAX'
                then concat('PMAX ', [campaignname_platform])
            else [adname_platform]
        end as adname_platform
    from doner_parse_cte
)


select * from doner_parse_cont_cte

