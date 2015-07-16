# -----------------------------------------------------------------------------
# Add user to table
# -----------------------------------------------------------------------------
get "/save_user" do
  if User.include(params['name']) 
    @error1 = true
    erb :"/users/add_user" 
  elsif User.empty(params['name'])
    @error2 = true
    erb :"/users/add_user"
  else
    User.add({"email" => params['email'], "name" => params['name'], "password" => params['password']})
    erb :"/users/added_user"
  end
end

# -----------------------------------------------------------------------------
# 
# -----------------------------------------------------------------------------
get "/authorize" do
  @user = User.find_by_email(params["email"])
  if @user.password === params["password"]
    session[:user_id] = @user.id
  else
    @error
    erb :"/users/login"
  end
end

# -----------------------------------------------------------------------------
# 
# -----------------------------------------------------------------------------
get "/users/update_user" do
  @user = User.find(params["id"].to_i)
  erb :"/users/update_user"
end

# -----------------------------------------------------------------------------
# User name updated.
# -----------------------------------------------------------------------------
get "/update_user/save" do
  @user = User.find(params['id'].to_i)
  @user.name = params["name"]
  if @user.save
    erb :"/users/user_updated"
  else
    @error = true
    erb :"/users/update_user"
  end
end

# -----------------------------------------------------------------------------
# User deleted.
# -----------------------------------------------------------------------------
get "/user_deleted" do
  @user = User.find(params['id'].to_i)
  if @user.delete
    erb :"/users/user_deleted"
  else
    @error = true
    erb :"/users/delete_user"
  end
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/users/:something" do
  erb :"/users/#{params["something"]}"
end