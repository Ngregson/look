-- identify the duplicates

select created_at, delivered_at, gender, num_of_item, returned_at, shipped_at, status, user_id, count(*)
from orders
group by created_at, delivered_at, gender, num_of_item, returned_at, shipped_at, status, user_id
having count(*) > 1;

-- create a view without duplicates

create view orders_clean as(
	with sub as (
		select
			*,
			row_number() over(partition by created_at, delivered_at, gender, num_of_item, returned_at, shipped_at, status, user_id) as rn
		from orders)
		
	select
		order_id, created_at, delivered_at, gender, num_of_item, returned_at, shipped_at, status, user_id
	from sub
	where rn = 1);

-- identify the null values

select *
from events
where user_id is null;

-- create view without null values

create view products_clean as
	(
	select *
	from products
	where 
		brand is not null 
		and 
		name is not null
	); 

-- check that the null values correspond between two tables.

select
	i.inventory_item_id,
	i.product_name,
	p.name
from inventory_items i
left join products p using (product_id)
where i.product_name is null;