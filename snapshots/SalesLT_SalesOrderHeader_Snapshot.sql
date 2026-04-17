{% snapshot SalesLT_SalesOrderHeader_Snapshot %}

{{
    config(
        unique_key='SalesOrderID',
        strategy='timestamp',
        updated_at='ModifiedDate'
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

{% endsnapshot %}
