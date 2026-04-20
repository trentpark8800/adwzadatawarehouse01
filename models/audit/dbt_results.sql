{{
  config(
    materialized = 'incremental',
    transient = False,
    unique_key = 'result_id',
    schema = 'audit'
  )
}}

with empty_table as (
    select
        cast(null as varchar(max)) as result_id,
        cast(null as varchar(max)) as invocation_id,
        cast(null as varchar(max)) as unique_id,
        cast(null as varchar(max)) as database_name,
        cast(null as varchar(max)) as schema_name,
        cast(null as varchar(max)) as name,
        cast(null as varchar(max)) as resource_type,
        cast(null as varchar(max)) as status,
        cast(null as float) as execution_time,
        cast(null as int) as rows_affected
)

select * from empty_table
-- This is a filter so we will never actually insert these values
where 1 = 0