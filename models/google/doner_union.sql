{{
  config(
    materialized = "view"
  )
}}

{{ dbt_utils.union_relations(

    relations=[source('GoogleSheets', 'DigitalData_AHA_Google'),
    source('GoogleSheets','DigitalData_DetroitZoo_Google'),
    source('GoogleSheets','DigitalData_HungryHowies_Google LDSM'),
    source('GoogleSheets','DigitalData_HungryHowies_Google Blitz'),
    source('GoogleSheets','DigitalData_HungryHowies_Google Mature Markets'),
    source('GoogleSheets','DigitalData_Motive_Google'),
    source('GoogleSheets','DigitalData_Sprayway_Google'),
    source('GoogleSheets','DigitalData_WorldStrides_Google'),
])}}