{% snapshot SalesLT_SalesOrderDetail_Snapshot %}

{{
    config(
        unique_key='SalesOrderDetailID',
        strategy='timestamp',
        updated_at='ModifiedDate'
    )
}}

SELECT
    SalesOrderID,
    SalesOrderDetailID,
    OrderQty,
    ProductID,
    UnitPrice,
    UnitPriceDiscount,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[SalesOrderDetail]

{% endsnapshot %}
