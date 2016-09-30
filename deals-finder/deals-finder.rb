### DEALS FINDER ###

# REQUIRE GEMS

require 'sqlite3'

# HIDE PASSWORD

require 'io/console'
text = STDIN.noecho(&:gets)

# CREATE SQLite3 DATABASE

db = SQLite3::Database.new("deals-finder.db")
db.results_as_hash = true

create_shoppers_table = <<-SQL
  CREATE TABLE IF NOT EXISTS shoppers(
    ID INTEGER PRIMARY KEY,
    First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
	Email_Address VARCHAR(255),
	DF_Password VARCHAR(255)
  )
SQL

create_business_owners_table = <<-SQL
  CREATE TABLE IF NOT EXISTS business_owners(
    ID INTEGER PRIMARY KEY,
    First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
	Email_Address VARCHAR(255),
	Business_Name VARCHAR(255),
	Business_Address VARCHAR(255),
	Business_Phone VARCHAR(255),
	Business_FEIN VARCHAR(255),
	DF_Password VARCHAR(255)
  )
SQL

create_deals_table = <<-SQL
  CREATE TABLE IF NOT EXISTS deals(
    ID INTEGER PRIMARY KEY,
    Item_Name VARCHAR(255),
	City VARCHAR(255),
	Price VARCHAR(255),
	Biz_Owner_ID VARCHAR(255),
	FOREIGN KEY (Biz_Owner_ID) REFERENCES business_owners(ID)
  )
SQL

db.execute(create_shoppers_table)
db.execute(create_business_owners_table)
db.execute(create_deals_table)

# DEALS FINDER CLASS

class Deals_Finder

	def initialize
	end

	def create_shopper(db)
		puts "What's your first name?"
		first_name = gets.chomp
		puts "What's your last name?"
		last_name = gets.chomp
		puts "What's your email address?"
		email = gets.chomp
		puts "Please create a Deals Finder password."
		df_password = STDIN.noecho(&:gets).chomp
		db.execute("INSERT INTO shoppers (First_Name, Last_Name, Email_Address, DF_Password) VALUES (?, ?, ?, ?)", [first_name, last_name, email, df_password])
	end

	def create_business_owner(db)
		puts "What's your first name?"
		first_name = gets.chomp
		puts "What's your last name?"
		last_name = gets.chomp
		puts "What's your email address?"
		email = gets.chomp
		puts "What's the name of your business?"
		business_name = gets.chomp
		puts "What's the address of your business?"
		business_address = gets.chomp
		puts "What's the phone number of your business?"
		business_phone = gets.chomp
		puts "What's your business's Federal Employer Identification Number (FEIN or EIN)?"
		fein = gets.chomp
		puts "Please create a Deals Finder password."
		df_password = STDIN.noecho(&:gets).chomp
		db.execute("INSERT INTO business_owners (First_Name, Last_Name, Email_Address, Business_Name, Business_Address, Business_Phone, Business_FEIN, DF_Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [first_name, last_name, email, business_name, business_address, business_phone, fein, df_password])
	end

	def create_deal(db, biz_owner_id)
		loop do
			puts "Please enter an item name. (type 'q' to exit)"
			item = gets.chomp.downcase
			break if item == 'q'
			puts "What city is this item sold in?"
			city = gets.chomp.downcase
			puts "What's the price of the item?"
			price = gets.chomp
			puts "What's the name of the business this item is sold at?"
			venue = gets.chomp
			puts "What's the address of the business this item is sold at?"
			address = gets.chomp
			puts "What's the phone number of the business this item is sold at?"
			inquiry = gets.chomp
			db.execute("INSERT INTO deals (Item_Name, City, Price, Business_Name, Business_Address, Business_Phone, Biz_Owner_ID) VALUES (?, ?, ?, ?, ?, ?, ?)", [item, city, price, venue, address, inquiry, biz_owner_id])
		end
	end

	def search_results(db)
		loop do
			puts "What city would you like to search? (type 'q' to exit)"
			city_search = gets.chomp.downcase
			break if city_search == 'q'
    		results = db.execute("SELECT * FROM deals WHERE City=(?)", [city_search])
    		results.each do | result |
    			puts "#{result['ID']}|#{result['Item_Name']}|#{result['City']}|#{result['Price']}|#{result['Business_Name']}|#{result['Business_Address']}|#{result['Business_Phone']}"
    		end
    	end
    end

    def see_my_deals(db, email)
    	results = db.execute("SELECT * FROM deals WHERE Biz_Owner_ID=(?)", [email])
    	results.each do | result |
    		puts "#{result['ID']}|#{result['Item_Name']}|#{result['City']}|#{result['Price']}|#{result['Business_Name']}|#{result['Business_Address']}|#{result['Business_Phone']}"
    	end
    end

    def see_shopper_info(db, email)
    	results = db.execute("SELECT * FROM shoppers WHERE Email_Address=(?)", [email])
    	results.each do | result |
    		puts "First Name: #{result['First_Name']}"
    		puts "Last Name: #{result['Last_Name']}"
    		puts "Email Address: #{result['Email_Address']}"
    		puts "Password: #{result['DF_Password']}"
    	end
    end

    def see_biz_owner_info(db, email)
    	results = db.execute("SELECT * FROM business_owners WHERE Email_Address=(?)", [email])
    	results.each do | result |
    		puts "First Name: #{result['First_Name']}"
    		puts "Last Name: #{result['Last_Name']}"
    		puts "Email Address: #{result['Email_Address']}"
    		puts "Business Name: #{result['Business_Address']}"
    		puts "Business Phone: #{result['Business_Phone']}"
    		puts "Business FEIN: #{result['Business_FEIN']}"
    		puts "Password: #{result['DF_Password']}"
    	end
    end

end

# USER INTERFACE

deals = Deals_Finder.new
puts "Welcome to Deals Finder! Are you a new user?"
puts "Kindly choose one: yes or no"
new_user = gets.chomp.downcase

if new_user == "yes"
	puts "Please tell us a little more about yourself."
	puts "Kindly choose one: business owner or shopper"
	new_user_type = gets.chomp.downcase
	if new_user_type == "shopper"
		deals.create_shopper(db)
	else
		new_user_type == 'business owner'
		deals.create_business_owner(db)
	end
else new_user == "no"
	puts "What kind of user are you?"
	puts "Kindly choose one: business owner or shopper"
	returning_user_type = gets.chomp.downcase
	puts "What's your email address?"
	returning_user_email = gets.chomp
	puts "Please enter your Deals Finder password."
	returning_user_df_password = STDIN.noecho(&:gets).chomp
	if returning_user_type == "shopper"
		puts "What would you like to do?"
		puts "Please select a number:"
		puts "1 = find deals, 2 = view my account info"
		old_shopper_action = gets.chomp.to_i
		if old_shopper_action == 1
			deals.search_results(db)
		else 
			old_shopper_action == 2
			deals.see_shopper_info(db, returning_user_email)
		end
	else returning_user_type == "business owner"
		puts "What would you like to do?"
		puts "Please select a number:"
		puts "1 = see my deals, 2 = add a new deal, 3 = view my account info"
		old_biz_owner_action = gets.chomp.to_i
		if old_biz_owner_action == 1
			deals.see_my_deals(db, returning_user_email)
		elsif old_biz_owner_action == 2
			deals.create_deal(db, returning_user_email)
		else
			old_biz_owner_action == 3
			deals.see_biz_owner_info(db, returning_user_email)
		end
	end
end