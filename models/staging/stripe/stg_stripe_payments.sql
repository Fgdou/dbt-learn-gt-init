select
    id as payment_id,
    {{cents_to_dollars("amount")}} as amount,
    created,
    orderid as order_id,
    paymentmethod,
    status
from {{ source('stripe', 'payment') }}