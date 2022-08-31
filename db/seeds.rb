# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#users
user1 = User.create(first_name: "Ann", last_name: "Lim", email: "ann@gmail.com", password: "ann123") # have accounts, contacts, HAVE triggers
user2 = User.create(first_name: "Bob", last_name: "Lee", email: "bob@gmail.com", password: "bob123") # have accounts, contacts, NO triggers
user3 = User.create(first_name: "Chan", last_name: "Chan", email: "chan@gmail.com", password: "chan123") # no accounts

#accounts
grab = Account.new(name: "Grab", category: "transportation", status: "Lead", potential_rev:1000000)
grab.user = user1
grab.save!

gojek = Account.new(name: "Gojek", category: "transportation", status: "Prospect", potential_rev:500000)
gojek.user = user1
gojek.save!

apple = Account.new(name: "Apple", category: "consumer electronics", status: "Live", potential_rev:1500000)
apple.user = user2
apple.save!

samsung = Account.new(name: "Samsung", category: "consumer electronics", status: "Churned", potential_rev:1250000)
samsung.user = user2
samsung.save!

#contacts
grab_manager = Contact.new(email: "bteo@grab.com", title: "Digital Manager", first_name: "Bryan", last_name: "Teo")
grab_manager.account = grab
grab_manager.save!

grab_director = Contact.new(email: "gfriedman@grab.com", title: "Digital Director", first_name: "Greg", last_name: "Friedman")
grab_director.account = grab
grab_director.save!

apple_tech = Contact.new(email: "jgeorge@apple.com", title: "Engineering Manager", first_name: "Jansen", last_name: "George")
apple_tech.account = apple
apple_tech.save!

apple_marketing = Contact.new(email: "achan@apple.com", title: "Marketing Manager", first_name: "Apple", last_name: "Chan")
apple_marketing.account = apple
apple_marketing.save!

# triggers
trigger_grab1 = Trigger.new
trigger_grab1.account = grab
trigger_grab1.contact = grab_director
trigger_grab1.save!

trigger_grab2 = Trigger.new
trigger_grab2.account = grab
trigger_grab2.contact = grab_manager
trigger_grab2.save!

# keywords for trigger grab1
keyword1 = Keyword.new(name: "grab")
keyword1.trigger = trigger_grab1
keyword1.save!

keyword2 = Keyword.new(name: "market value")
keyword2.trigger = trigger_grab1
keyword2.save!

keyword3 = Keyword.new(name: "overvalued")
keyword3.trigger = trigger_grab1
keyword3.save!

keyword4 = Keyword.new(name: "loss")
keyword4.trigger = trigger_grab1
keyword4.save!

keyword5 = Keyword.new(name: "cuts")
keyword5.trigger = trigger_grab1
keyword5.save!

#keywords for trigger grab2
keyword6 = Keyword.new(name: "grab")
keyword6.trigger = trigger_grab2
keyword6.save!

keyword7 = Keyword.new(name: "growth")
keyword7.trigger = trigger_grab2
keyword7.save!

keyword8 = Keyword.new(name: "delivery")
keyword8.trigger = trigger_grab2
keyword8.save!


#news
news1 = News.create(title: "this is a placeholder title", link: "straitstimes.com", keywords: ["grab", "gojek", "drivers", "earnings", "acquisition"], creator: "Bunardi", pubDate: Date.today - 1.day, content: "this is a placeholder content grab ride-hailing  drivers angry valuation drop overvalued")
