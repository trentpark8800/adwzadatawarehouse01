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
    Name,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[ProductCategory]

{% endsnapshot %}
