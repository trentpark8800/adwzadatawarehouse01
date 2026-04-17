{{
    config(
        materialized='incremental',
        unique_key='SalesOrderID'
    )
}}

SELECT
    SalesOrderID,
    RevisionNumber,
    OrderDate,
    DueDate,
    ShipDate,
    Status,
    CustomerID,
    ShipToAddressID,
    BillToAddressID,
    ShipMethod,
    CreditCardApprovalCode,
    SubTotal,
    TaxAmt,
    Freight,
    Comment,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[SalesOrderHeader]
{% if is_incremental() %}
WHERE ModifiedDate > (SELECT COALESCE(MAX(ModifiedDate), '1900-01-01') FROM {{ this }})
{% endif %}
