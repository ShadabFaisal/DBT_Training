SELECT 
-- from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice,
o.ordercostprice,
o.ordersellingprice-o.ordercostprice as orderprofit,
-- from raw customers
c.customername,
c.segment,
c.country,
-- from raw product
p.category,
p.productname,
p.subcategory
FROM {{ ref('raw_orders') }} o 
left join {{ ref('raw_customer') }} c 
on o.customerid=c.customerid
left join {{ ref('raw_product')}} p
on o.productid=p.productid
