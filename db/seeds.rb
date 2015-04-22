#Deleting all the seed data and reset the primary key sequence
Product.delete_all
Order.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!("products")
ActiveRecord::Base.connection.reset_pk_sequence!("orders")

#Create products
Product.create(title: 'Polo Black', description: 'Easy Polo Black Edition', price: 10.50)

Product.create(title: 'Polo Red', description: 'Easy Polo Red Edition', price: 8.50)

Product.create(title: 'Polo Blue', description: 'Easy Polo Blue Edition', price: 9.50)

Product.create(title: 'Polo White', description: 'Easy Polo White Edition', price: 10.00)

Product.create(title: 'Polo Silk', description: 'Easy Polo Silk Edition', price: 12.50)

Product.create(title: 'Polo Green', description: 'Easy Polo Green Edition', price: 15.50)

#Create Orders
Order.create(product_id: 1, quantity: 2, price: 10.50, value: 21, status: true)

Order.create(product_id: 2, quantity: 1, price: 8.50, value: 8.50, status: false)

Order.create(product_id: 3, quantity: 3, price: 9.50, value: 28.50, status: true)

Order.create(product_id: 4, quantity: 2, price: 10.00, value: 20, status: false)