{{ config(enabled=var('xero__using_bank_transfer', False)) }}

{{
    fivetran_utils.union_data(
        table_identifier='bank_transfer', 
        database_variable='xero_database', 
        schema_variable='xero_schema', 
        default_database=target.database,
        default_schema='xero',
        default_variable='bank_transfer'
    )
}} 