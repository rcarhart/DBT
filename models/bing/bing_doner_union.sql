{{
  config(
    materialized = "view"
  )
}}

{{ dbt_utils.union_relations(

    relations=[source('GoogleSheets','DigitalData_AHA_Bing'),
    source('GoogleSheets','DigitalData_WorldStrides_Bing'),
    source('GoogleSheets','DigitalData_Motive_Bing'),
])}}