select
    id as payment_id,
    amount / 100 as amount,
    created,
    orderid as order_id,
    paymentmethod,
    status
from raw.stripe.payment