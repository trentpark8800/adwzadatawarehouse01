{{
    config(
        materialized='incremental',
        unique_key='ProductCategoryID'
    )
}}

SELECT
    ProductCategoryID,
    ParentProductCategoryID,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[ProductCategory]
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
