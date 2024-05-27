-- Analyse the cummulative renvenue generated over time

select order_date,
sum(renvenue) over(order by order_date) as cumm_revenue
 from  	
 (select orders.order_date,sum(order_details.quantity*pizzas.price) as renvenue
 from order_details join pizzas
 on order_details.pizza_id=pizzas.pizza_id
 join orders
 on orders.order_id=order_details.order_id
group by orders.order_date) as sales;