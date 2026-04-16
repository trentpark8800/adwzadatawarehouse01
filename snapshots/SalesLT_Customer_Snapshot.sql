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
    NameStyle,
    Title,
    FirstName,
    MiddleName,
    LastName,
    Suffix,
    CompanyName,
    SalesPerson,
    EmailAddress,
    Phone,
    PasswordHash,
    PasswordSalt,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[Customer]

{% endsnapshot %}
