# -----------------------------------------------------------------------------
# Add rating to table.
# -----------------------------------------------------------------------------
get "ratings/beer_rated" do
   binding.pry
  if Rating.empty(params['abv'].to_i)
    @error = true
    erb :"ratings/add_beer_rating"
  else
    Rating.add({"user_id" => params['user_id'].to_i, "beer_id" => params['beer_id'].to_i, "rating" => params['rating'].to_i})
    erb :"/ratings/beer_rated"
  end
end
  
# -----------------------------------------------------------------------------
# List history of user beer ratings.
# -----------------------------------------------------------------------------
get "/ratings/list_user_history" do
  @user = User.find(params['user_id'].to_i)
  @user_history = Rating.history(@user.id)
  erb :"/ratings/list_user_history"
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/ratings/:something" do
  erb :"/ratings/#{params["something"]}"
end