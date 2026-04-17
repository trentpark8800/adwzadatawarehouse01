{{
    config(
        materialized='incremental',
        unique_key='AddressID'
    )
}}

SELECT
    AddressID,
    AddressLine1,
    AddressLine2,
    City,
    PostalCode,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[Address]
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
