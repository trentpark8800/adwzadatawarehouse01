{% snapshot SalesLT_Customer_Snapshot %}

{{
    config(
        unique_key='CustomerID',
        strategy='timestamp',
        updated_at='ModifiedDate'
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

{% endsnapshot %}
