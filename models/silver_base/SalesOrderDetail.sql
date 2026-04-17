{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='SalesOrderDetailID'
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
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
