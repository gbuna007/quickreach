# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#accounts
grab = Account.new(name: "Grab", category: "transportation", status: "Lead", potential_rev:1000000)
gojek = Account.new(name: "Gojek", category: "transportation", status: "Prospect", potential_rev:500000)
apple = Account.new(name: "Apple", category: "consumer electronics", status: "Live", potential_rev:1500000)
samsung = Account.new(name: "Samsung", category: "consumer electronics", status: "Churned", potential_rev:1250000)

#contacts
