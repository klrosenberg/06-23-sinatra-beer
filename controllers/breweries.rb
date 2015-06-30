# -----------------------------------------------------------------------------
# Add brewery to table
# -----------------------------------------------------------------------------
get "/save_brewery" do
  if Brewery.include(params['name']) 
    @error1 = true
    erb :"breweries/add_brewery" 
  elsif Brewery.empty(params['name'])
    @error2 = true
    erb :"breweries/add_brewery"
  else
    Brewery.add({"name" => params['name']})
    erb :"breweries/added_brewery"
  end
end

get "/breweries/update_brewery" do
  @brewery = Brewery.find(params["id"].to_i)
  erb :"/breweries/update_brewery"
end

# -----------------------------------------------------------------------------
# Brewery name updated.
# -----------------------------------------------------------------------------
get "/update_brewery/save" do
  @brewery = Brewery.find(params['id'].to_i)
  @brewery.name = params["name"]
  if @brewery.save
    erb :"breweries/brewery_updated"
  else
    @error = true
    erb :"breweries/update_brewery"
  end
end

# -----------------------------------------------------------------------------
# Brewery deleted.
# -----------------------------------------------------------------------------
get "/brewery_deleted" do
  @brewery = Brewery.find(params['id'].to_i)
  if Beer.where("brewery_id", params['id']).length > 0
    @error = true
    erb :"/breweries/delete_brewery"
  else @brewery.delete
    erb :"/breweries/brewery_deleted"
  end
end


# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/breweries/:something" do
  erb :"/breweries/#{params["something"]}"
end