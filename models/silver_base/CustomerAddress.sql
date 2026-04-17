{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['CustomerID', 'AddressID']
    )
}}

SELECT
    CustomerID,
    AddressID,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[CustomerAddress]
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
