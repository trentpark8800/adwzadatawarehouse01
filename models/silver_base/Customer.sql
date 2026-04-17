{{
    config(
        materialized='incremental',
        unique_key='CustomerID'
    )
}}

SELECT
    CustomerID,
    Title,
    Suffix,
    CompanyName,
    SalesPerson,
    EmailAddress,
    PasswordHash,
    PasswordSalt,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[Customer]
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
