with metrics_paid as (
    {%- set metrics = ["clicks", "impressions", "video100percent", "video50percent", "video75percent", "video25percent", "cost"] -%}
    select
        platform,
        adgroupid,
        adid,
        [date],
        client,
        property,
        cast(getdate() as date) as load_date,
        {% for metric in metrics %}
            sum({{ metric }}) as {{ metric }}{% if not loop.last %},{% endif %}
        {% endfor %}

    from {{ ref('doner_google_sources') }}
    where conversiontype is null
    group by
        platform,
        adgroupid,
        adid,
        [date],
        client,
        property
    having sum(clicks) + sum(impressions) + sum(cost) > 0

)
select * from metrics_paid
