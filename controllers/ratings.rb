# -----------------------------------------------------------------------------
# Add rating to table.
# -----------------------------------------------------------------------------
get "/ratings/beer_rated" do
    Rating.add({"user_id" => params['user_id'], "beer_id" => params['beer_id'], "rating" => params['rating']})
    erb :"/ratings/beer_rated"
end

# -----------------------------------------------------------------------------
# List history of user beer ratings.
# -----------------------------------------------------------------------------
get "/ratings/list_user_history" do
  @user = User.find(params['user_id'])
  @user_history = Rating.history(@user.id)
  erb :"/ratings/list_user_history"
end

get "/ratings/delete_rating" do
  @ratings = Rating.chart
  erb :"/ratings/delete_rating"
end

# -----------------------------------------------------------------------------
# Rating deleted.
# -----------------------------------------------------------------------------
get "/rating_deleted" do
  @rating = Rating.find(params['id'])
  if @rating.delete
    erb :"/ratings/rating_deleted"
  end
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/ratings/:something" do
  erb :"/ratings/#{params["something"]}"
end