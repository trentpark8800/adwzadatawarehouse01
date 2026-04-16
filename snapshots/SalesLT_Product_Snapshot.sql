{% snapshot SalesLT_Product_Snapshot %}

{{
    config(
        unique_key='ProductID',
        strategy='timestamp',
        updated_at='ModifiedDate'
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

{% endsnapshot %}
