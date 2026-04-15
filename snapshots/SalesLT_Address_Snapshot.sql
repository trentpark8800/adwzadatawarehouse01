{% snapshot SalesLT_Address_Snapshot %}

{{
    config(
        unique_key='AddressID',
        strategy='timestamp',
        updated_at='ModifiedDate'
    )
}}

SELECT
    AddressID,
    AddressLine1,
    AddressLine2,
    City,
    PostalCode,
    rowguid,
    ModifiedDate
FROM [adwzasqldb01].[SalesLT].[Address]

{% endsnapshot %}