# -----------------------------------------------------------------------------
# Add beer type to table
# -----------------------------------------------------------------------------
get "/save_beer_type" do
  if BeerType.include(params['name']) 
    @error1 = true
    erb :"beer_types/add_beer_type" 
  elsif BeerType.empty(params['name'])
    @error2 = true
    erb :"beer_types/add_beer_type"
  else
    BeerType.add({"name" => params['name']})
    erb :"beer_types/added_beer_type"
  end
end

get "/beer_types/update_beer_type" do
  @beer_type = BeerType.find(params["id"].to_i)
  erb :"/beer_types/update_beer_type"
end

# -----------------------------------------------------------------------------
# Beer type name updated.
# -----------------------------------------------------------------------------
get "/update_beer_type/save" do
  @beer_type = BeerType.find(params['id'].to_i)
  @beer_type.name = params["name"]
  if @beer_type.save
    erb :"beer_types/beer_type_updated"
  else
    @error = true
    erb :"beer_types/update_beer_type"
  end
end

# -----------------------------------------------------------------------------
# Beer type deleted.
# -----------------------------------------------------------------------------
get "/beer_type_deleted" do
  @beer_type = BeerType.find(params['id'].to_i)
  if @beer_type.delete
    erb :"beer_types/beer_type_deleted"
  else
    @error = true
    erb :"beer_types/update_beer_type"
  end
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/beer_types/:something" do
  erb :"/beer_types/#{params["something"]}"
end

