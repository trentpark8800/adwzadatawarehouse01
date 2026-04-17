{% macro fabric__current_timestamp() %}
    GETUTCDATE()
{% endmacro %}