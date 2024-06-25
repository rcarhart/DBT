{% macro trim_and_null(fields_to_trim) %}
        {% for field in fields_to_trim %}
        case
            when len(trim({{ field }})) = 0 then null else trim({{ field }}) end as {{ field }}{% if not loop.last %},{% endif %}
        {% endfor %}
{% endmacro %}
