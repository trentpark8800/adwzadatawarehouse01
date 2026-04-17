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
    CAST(ModifiedDate AT TIME ZONE 'UTC' AS datetimeoffset) AS ModifiedDate
FROM [adwzasqldb01].[SalesLT].[Customer]

{% endsnapshot %}
