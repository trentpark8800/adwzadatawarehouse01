{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='ProductID'
    )
}}

SELECT
    ProductID,
    ProductNumber,
    Color,
    StandardCost,
    ListPrice,
    Size,
    Weight,
    ProductCategoryID,
    ProductModelID,
    SellStartDate,
    SellEndDate,
    DiscontinuedDate,
    ThumbNailPhoto,
    ThumbnailPhotoFileName,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[Product]
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
