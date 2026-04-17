{% snapshot SalesLT_ProductCategory_Snapshot %}

{{
    config(
        unique_key='ProductCategoryID',
        strategy='timestamp',
        updated_at='ModifiedDate'
    )
}}

SELECT
    ProductCategoryID,
    ParentProductCategoryID,
    rowguid,
    CAST(ModifiedDate AT TIME ZONE 'UTC' AS datetimeoffset) AS ModifiedDate
FROM [adwzasqldb01].[SalesLT].[ProductCategory]

{% endsnapshot %}
