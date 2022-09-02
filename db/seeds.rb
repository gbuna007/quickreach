# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users
user1 = User.create(first_name: "Ann", last_name: "Lim", email: "ann@gmail.com", password: "ann123") # have accounts, contacts, HAVE triggers
user2 = User.create(first_name: "Bob", last_name: "Lee", email: "bob@gmail.com", password: "bob123") # have accounts, contacts, NO triggers
user3 = User.create(first_name: "Chan", last_name: "Chan", email: "chan@gmail.com", password: "chan123") # no accounts

# accounts
grab = Account.new(name: "Grab", category: "transportation", status: "Lead", potential_rev: 1000000, amount_spent: 1000)
grab.user = user1
grab.save!

gojek = Account.new(name: "Gojek", category: "transportation", status: "Prospect", potential_rev: 500000, amount_spent: 5000)
gojek.user = user1
gojek.save!

apple = Account.new(name: "Apple", category: "consumer electronics", status: "Live", potential_rev: 1500000, amount_spent: 15000)
apple.user = user2
apple.save!

samsung = Account.new(name: "Samsung", category: "consumer electronics", status: "Churned", potential_rev: 1250000, amount_spent: 1250)
samsung.user = user2
samsung.save!

# contacts
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
trigger_grab1.name = "Grab negative news draft"
trigger_grab1.account = grab
trigger_grab1.contact = grab_director

trigger_grab2 = Trigger.new
trigger_grab2.name = "Grab positive news draft"
trigger_grab2.account = grab
trigger_grab2.contact = grab_manager

#news
news1 = News.create(title: "this is a placeholder title", link: "straitstimes.com", keywords: ["grab", "gojek", "drivers", "earnings", "acquisition"], creator: "Bunardi", pubDate: Date.today - 1.day, content: "this is a placeholder content grab ride-hailing  drivers angry valuation drop overvalued market value loss cuts")

news2 = News.create(title: "Responses to delivery riders missing the bigger picture — Edwin Goh", link: "https://www.malaymail.com/news/what-you-think/2022/08/29/responses-to-delivery-riders-missing-the-bigger-picture-edwin-goh/25316", keywords:["delivery riders","grab delivery","gig economy"],description:"AUGUST 29 — In early August, a number of delivery riders under the banner of Food Delivery Blackout gathered at Grab hea...",content:"AUGUST 29 — In early August, a number of delivery riders under the banner of Food Delivery Blackout gathered at Grab headquarters to submit a memorandum demanding better compensation and working conditions. At around the same time, Capital A (the parent company of AirAsia Super App and AirAsia Food) announced that it will offer formal jobs to an unspecified number of its delivery riders with a minimum of RM3,000 monthly salary and full-time benefits. A few days later, the Transport Minister remarked on mandatory licensing for delivery riders, drawing vehement criticism from delivery rider group Penghantar for potential over-regulation . The plight of delivery riders has gained much more exposure in recent years, a reflection of their role and importance in urban Malaysian life today. In tandem, the plight of delivery riders is also becoming increasingly important to political parties, with various representative groups attracting cross-partisan interest from Umno and PKR . Perhaps, as a result, the government via the Transport Ministry is giving representative groups space to share their concerns on delivery fares and social protection. All this attention is to the good. Nevertheless, the policy analysis and responses that have been proposed so far have been, in our view, rather disappointing. As pointed out in a recent article , there is no clear consensus amongst delivery riders themselves whether they want to be considered as formal employees — one of the ‘solutions’ that have been proposed. The bigger picture currently not being addressed, in our view, is the nature of gig work itself and how our policies on employment classifications and benefits need to evolve accordingly. Tackling the root problem Globally, gig workers are increasingly dissatisfied with their end of the bargain. And countries across the globe have taken differing policy approaches in attempting to provide some measure of labour protection and to ensure fairer labour terms. In Malaysia, gig workers lack rights, benefits and protections as they are legally designated as independent contractors. To a degree, the government has recognised their vulnerabilities; gig workers are specifically mentioned in the 2021 Economic Outlook Report and some forms of assistance have been introduced including work accident insurance by Socso, a voluntary retirement savings programme under EPF, a housing credit guarantee scheme , various digital reskilling programmes , a microfinance initiative and many more. But none of these addresses the nature of platform gig work which revolves around delivery fares , payment schedules , rating systems , not to mention general issues on social protection . It is increasingly evident that there is no way to ensure decent work for gig workers without clarifying their employment classification. If Malaysia intends to maintain the status quo of keeping them as independent contractors, a comprehensive universal safety net would be required to ensure adequate social protection for gig workers (and indeed, all workers). Without a universal safety net, labour laws and benefits that are designed with full-time formal employment in mind will exclude gig workers who do not meet the employment definition. Why not reclassify gig workers as formal employees with full-time benefits? This approach would be viable only if all gig workers work full — time with one particular gig platform. However, this is hardly the reality. Not all gig workers are the same . Our 2019 study found that gig workers were almost evenly distributed between full-timers and part-timers, and both types of gig workers view gig work as an important income source. Perhaps more importantly, the majority of gig workers according to our study have a strong preference for job flexibility. Reclassifying all gig workers as formal employees risks curtailing their job flexibility and may produce unintended consequences. As seen in Germany , Spain and most recently the Netherlands , some gig platforms have ceased country operations entirely after formal employment classification was imposed, rendering their business models unsustainable. The all-or-nothing approach of classifying gig workers either as independent contractors or formal employees carries risks from two extreme ends: on the one hand, classifying as independent contractors means leaving gig workers vulnerable to algorithms and working conditions that are highly influenced by gig platforms’ practices. On the other hand, classifying gig workers as formal employees would increase the cost of doing business without necessarily improving their working conditions or preserving their jobs. Policymakers need to develop a new employment classification. Our cross-country comparison of gig worker policies shows a few country experiences we can learn from and to this end, we suggest a new worker category known as a dependent contractor to capture the unique nature of gig work. This new classification would allow the government to prescribe labour provisions for gig workers based on the labour power dynamics inherent in gig platforms. Note: More on this, and on worker benefits in our current age of job informalisation, can be read in our Fair Work Act proposal. Regulatory sandbox needed to facilitate regulatory innovation We’ve seen what happens when significant policy decisions — such as imposing blanket full-time employment classification — are meted out on gig ecosystems. Customisation and evolution from our current policy paradigms are required to balance job flexibility with worker protection. Therefore, for a feasible duration, we fully support a policy environment of trialling and flexibility for regulators in developing a better employment classification for gig workers. As a way of navigating this uncharted policy territory, we propose the creation of a regulatory sandbox to negotiate and formalise the structure, scope and terms for a proposed National Employment Status Test, which would ultimately lead to an employment classification for gig workers that is fit for purpose. What is a regulatory sandbox? A regulatory sandbox refers to a controlled environment under regulatory supervision which is typically used for testing new products, services, business models and delivery mechanisms in the financial sector. We have seen similar initiatives undertaken in other countries to spur regulatory innovation for protecting gig workers. In Denmark, a gig platform Hilfr and Danish union 3F collaborated to test a new classification method that automatically recategorises qualified gig workers as employees with some employment benefits, and an opt-out option to remain self-employed. And in mid-2022, Uber and the Transport Workers Union signed a joint Statement of Principles to call for legislating an independent body for studying and reforming the rights and conditions of gig workers in the transportation and food delivery sectors. A local example would be the regulatory sandbox to provide a regulatory environment for financial technology established by Bank Negara Malaysia in 2016. We believe that the Ministry of Human Resources (MOHR) is well positioned to set up a regulatory sandbox for re-classifying gig workers, where novel regulatory approaches like the National Employment Status Test can be developed and tested. The government can spearhead the regulatory sandbox with the participation of key stakeholders to conduct studies and policy experiments within a set time. The shift away from formal full-time employment to flexible hour gig work marks a significant, perhaps enduring, change in contemporary work culture. Emerging labour trends, including flexible work, remote working and digital nomadism, are creating new challenges for labour laws that were formulated in the past prior to its existence. We have arrived at a policy juncture where the government must decide between two policy approaches: a wait-and-see strategy with incremental policy shifts, or a structured trial-and-error approach to seeking new regulatory innovations. We believe that the latter is a more progressive, forward-looking policy approach in embracing the future of work to ensure decent work for all. * Edwin Goh is a researcher under the ‘Safety Nets’ pillar from The Centre , a centrist think tank based in Kuala Lumpur. Readers may email their views and suggestions at [email protected] . ** This is the personal opinion of the writer or publication and does not necessarily represent the views of Malay Mail.",pubDate:("2022-08-29 04:03:57").to_date,source_id:"malaymail")

news3 = News.create(link: "https://www.techinasia.com/goto-gojek-acquire-crypto-exchange-kripto-maksima-koin", title: "GoTo Group acquires Indonesian crypto exchange for $8.4m", creator: "Aditya Hadi Pratama", keywords: ["crypto", "acquisition", "license", "assets"], description: "
GoTo Group, the merged entity of major Indonesian tech players Gojek and Tokopedia, has acquired local crypto exchange company Kripto Maksima Koin for 124.8 billion rupiah (around US$8.4 million).", content: "Kripto Maksima Koin is one of 25 crypto exchanges registered under Indonesia’s Commodity Futures Trading Regulatory Agency (Bappebti). According to Bappebti’s directory, the exchange operates the kriptomaksima website, but it has no offered service at the time of publication. The regulator halted the process of issuing new licenses earlier this month. Bappebti said that it wants to realize “transparent, efficient, and effective trading activities of crypto assets with fair competition to protect the interests of all parties in the crypto trading market. The moratorium may have made existing license holders acquisition targets for new players that want to open crypto exchanges in the country. It’s not the first time GoTo Group has acquired a crypto startup. In 2019, Gojek acquired Philippines-based Coins.ph for around US$95 million. However, it sold the crypto firm to former Binance CFO Wei Zhou earlier this year for double that amount.", pubDate: ("30 Aug 2022").to_date, source_id:"techinasia")

news3 = News.create(link: "https://www.bloomberg.com/news/articles/2022-03-03/grab-loss-swells-as-pandemic-hampers-ride-hailing-demand", creator: "Olivia Poh", keywords: ["grab", "revenue decline", "net loss", "black-check"], title: "Grab Loss Swells on Spending to Lure Drivers, Customers", description: "Quarterly revenue declines 44% at Singapore-based ride giant. Grab shares have plunged since SPAC deal completed in December.", content: "Grab Holdings Inc., Southeast Asia’s ride-hailing and delivery giant, reported a wider loss after the company spent more on incentives to lure drivers and customers as the pandemic eases. The Singapore-based company’s net loss almost doubled to $1.1 billion for the quarter ended Dec. 31, also hurt by non-cash interest costs and expenses related to its public listing, it said on Thursday. Analysts estimated a loss of $645 million on average. Revenue fell 44% to $122 million, affected by the incentives offered to users and drivers. Grab -- which counts SoftBank Group Corp. and Uber Technologies Inc. as its two biggest shareholders -- has struggled to gain a steady footing since it became a publicly listed company in the U.S. through a deal with a blank-check company in December. Its shares have lost about half their market value since, wiping more than $15 billion from its market capitalization.", pubDate: ("3 March 2022").to_date, source_id: "bloomberg")

# old news seed
google = OldNews.create(link: "google.com")

# template seed for ANN
template_grab = Template.new(name: "Grab Challenger Sell", body: "Hello <<contact_fn>>!\r\nThis is a placeholder text\r\nChecking if we will be able to interpolate this following <<account_name>>", subject: "Testing template")
template_grab.user = user1
template_grab.save!

trigger_grab1.template = template_grab
trigger_grab1.save!

trigger_grab2.template = template_grab
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

# keywords for trigger grab2
keyword6 = Keyword.new(name: "grab")
keyword6.trigger = trigger_grab2
keyword6.save!

keyword7 = Keyword.new(name: "growth")
keyword7.trigger = trigger_grab2
keyword7.save!

keyword8 = Keyword.new(name: "delivery")
keyword8.trigger = trigger_grab2
keyword8.save!
