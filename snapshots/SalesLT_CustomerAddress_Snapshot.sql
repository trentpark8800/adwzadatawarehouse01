{% snapshot SalesLT_CustomerAddress_Snapshot %}

{{
    config(
        unique_key=['CustomerID', 'AddressID'],
        strategy='timestamp',
        updated_at='ModifiedDate'
    )
}}

SELECT
    CustomerID,
    AddressID,
    rowguid,
    CAST(ModifiedDate AT TIME ZONE 'UTC' AS datetimeoffset) AS ModifiedDate
FROM [adwzasqldb01].[SalesLT].[CustomerAddress]

{% endsnapshot %}
