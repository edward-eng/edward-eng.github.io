require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("deals-finder.db")
db.results_as_hash = true

get '/' do
  # @results = db.execute("SELECT * FROM deals")
  erb :home
end

get '/home' do
	erb :home
end

get '/returning_user' do
	erb :returning_user
end

get '/new_user' do
	erb :new_user
end

get '/old_shopper' do
	erb :old_shopper
end

get '/old_biz_owner' do
	erb :old_biz_owner
end

get '/new_shopper' do
	erb :new_shopper
end

get '/new_biz_owner' do
	erb :new_biz_owner
end

get '/search_results' do
	@results = db.execute("SELECT * FROM deals WHERE City=?", params[:City])
	erb :search_results
end

get '/submit_deal' do
	db.execute("INSERT INTO deals (Item_Name, City, Price, Business_Name, Business_Address, Business_Phone, Biz_Owner_ID) VALUES (?, ?, ?, ?, ?, ?, ?)", [params['Item_Name'], params['City'], params['Price'], params['Business_Name'], params['Business_Address'], params['Business_Phone'], params['Biz_Owner_ID']])
	redirect '/'
end

get '/create_shopper' do
	db.execute("INSERT INTO shoppers (First_Name, Last_Name, Email_Address, DF_Password) VALUES (?, ?, ?, ?)", [params['First_Name'], params['Last_Name'], params['Email_Address'], params['DF_Password']])
	redirect '/'
end

get '/create_biz_owner' do
	db.execute("INSERT INTO business_owners (First_Name, Last_Name, Email_Address, Business_Name, Business_Address, Business_Phone, Business_FEIN, DF_Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [params['First_Name'], params['Last_Name'], params['Email_Address'], params['Business_Name'], params['Business_Address'], params['Business_Phone'], params['Business_FEIN'], params['DF_Password']])
	redirect '/'
end

# post '/search_results' do
# 	@results = db.execute("SELECT * FROM deals WHERE City=?", [params[:name]])
# end