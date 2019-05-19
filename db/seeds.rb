# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
my_ip = Address.create ip_address: '10.10.10.10'
my_server = Server.create server_name: 'my_master'
my_ip.servers << my_server
my_server.addresses << my_ip
