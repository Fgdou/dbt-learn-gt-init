with orders as (
    select * from {{ ref('stg_jaffle_shop_orders') }}
),

finance_orders as (
    select * from {{ ref('stg_stripe_payments') }}
),

orders_with_amount as (
    select 
        orders.order_id,
        orders.customer_id,
        sum(case when finance_orders.status = 'success' then finance_orders.amount end) as amount,
    from orders
    left join finance_orders using (order_id)
    group by 1, 2
)

select * from orders_with_amount