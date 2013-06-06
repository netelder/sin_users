get '/' do
  redirect "/login/#{current_user.id}" if current_user
  erb :index
end
