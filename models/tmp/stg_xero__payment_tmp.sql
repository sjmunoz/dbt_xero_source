
{{
    fivetran_utils.union_data(
        table_identifier='payment', 
        database_variable='xero_database', 
        schema_variable='xero_schema', 
        default_database=target.database,
        default_schema='xero',
        default_variable='payment'
    )
}} 