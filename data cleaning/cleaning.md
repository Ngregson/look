## Checking Data Quality

Data cleaning is performed directly at the database level and involves creating clean views that will be retrieved in Power BI.

The following tasks have been completed:

- Addition of constraints on primary keys

- Clarification of column names and addition of constraints on foreign keys

- Identification of duplicates in each of the tables. 44 duplicates were identified in the orders table.

Theses duplicates have been removed from the view orders_clean created from the orders table.

- Identification of null values
	- table events: 1,124,626 null values for user_id
	- table inventory_items: 
		- 426 null values for product_brand
		- 23 null values for product_name
		- 308,734 null values for sold_at
	- table order_items
		- 118,437 null values for delivered_at
		- 163,755 null values for returned_at
		- 63,681 null values for created_at
	- table orders
		- 81,626 null values for delivered_at
		- 112,9556 null values for returned_at
		- 43,791 null values for shipped_at
	- table products
		- 24 null values for brand
		- 2 null values for name

Null values for name and brand correspond to null values in the product table. Since the quantity of these null values is marginal, they have been removed in the products_clean and inventory_clean views created from the initial tables.

Other null values are retained as they correspond to information not yet filled in.













