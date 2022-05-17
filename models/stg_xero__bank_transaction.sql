{{ config(enabled=var('xero__using_bank_transaction', True)) }}

with base as (

    select * 
    from {{ ref('stg_xero__bank_transaction_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_xero__bank_transaction_tmp')),
                staging_columns=get_bank_transaction_columns()
            )
        }}

        {{ fivetran_utils.add_dbt_source_relation() }}
    from base
),

final as (
    
    select 
        bank_transaction_id,
        contact_id,
        currency_code,
        currency_rate,
        date,
        sub_total,
        total,
        total_tax,
        type

        {{ fivetran_utils.source_relation() }}

    from fields
)

select * from final