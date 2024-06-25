with metrics_paid as (
    {%- set metrics = ["Clicks", "Impressions", "video100percent", "video50percent", "video75percent", "video25percent", "cost"] -%}
    select
        platform,
        adgroupid,
        adid,
        [Date],
        client,
        property,
        cast(getdate() as date) as load_date,
        {% for metric in metrics %}
            sum({{ metric }}) as {{ metric }}{% if not loop.last %},{% endif %}
        {% endfor %}

    from {{ ref('doner_google_sources') }}
    where conversiontype is not null
    group by
    platform,
    adgroupid,
    adid,
    [Date],
    client,
    property

)
select * from metrics_paid
