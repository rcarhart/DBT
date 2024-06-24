{% macro trim_if_empty(fields_to_trim) %}
    {% set trimmed_fields = [] %}
    {% for field in fields_to_trim %}
        {% set trimmed_fields = trimmed_fields + [
            "CASE WHEN LEN(TRIM(" ~ field ~ ")) = 0 THEN NULL ELSE TRIM(" ~ field ~ ")) END AS " ~ field
        ] %}
    {% endfor %}
    {{ return(trimmed_fields | join(', ')) }}
{% endmacro %}
