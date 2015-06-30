# -----------------------------------------------------------------------------
# Add beer to table
# -----------------------------------------------------------------------------
get "/save_beer" do
  if Beer.include(params['name']) 
    @error1 = true
    erb :"/beers/add_beer" 
  elsif Beer.empty(params['name'])
    @error2 = true
    erb :"/beers/add_beer"
  else
    Beer.add({"name" => params['name'], "abv" => params['abv'].to_f, "beer_type_id" => params['beer_type_id'].to_i, "brewery_id" => params['brewery_id'].to_i})
    erb :"/beers/added_beer"
  end
end

# -----------------------------------------------------------------------------
# List beers in a table.
# -----------------------------------------------------------------------------
get "/beers/beer_chart" do
  @beers = Beer.chart
  erb :"/beers/beer_chart"
end

# -----------------------------------------------------------------------------
# Update beer by id.
# -----------------------------------------------------------------------------
get "/beers/update_beer" do
  @beer = Beer.find(params["id"].to_i)
  erb :"/beers/update_beer"
end

# -----------------------------------------------------------------------------
# Beer name updated.
# -----------------------------------------------------------------------------
get "/update_beer/save" do
  @beer = Beer.find(params['id'].to_i)
  @beer.name = params["name"]
  @beer.abv = params["abv"]
  @beer.beer_type_id = params["beer_type_id"]
  @beer.brewery_id = params["brewery_id"]
  if @beer.save
    erb :"/beers/beer_updated"
  else
    @error = true
    erb :"/beers/update_beer"
  end
end

# -----------------------------------------------------------------------------
# Beer deleted.
# -----------------------------------------------------------------------------
get "/beer_deleted" do
  @beer = Beer.find(params['id'].to_i)
  if Rating.where("beer_id", params['id']).length > 0
    @error = true
    erb :"/beers/delete_beer"
  else @beer.delete
    erb :"/beers/beer_deleted"
  end
end

#   if @beer.delete
#     erb :"/beers/beer_deleted"
#   else
#     @error = true
#     erb :"/beers/update_beer"
#   end
# end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/beers/:something" do
  erb :"/beers/#{params["something"]}"
end
