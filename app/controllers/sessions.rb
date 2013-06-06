post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    @failed = false
    session[:user_id] = @user.id
    redirect "/login/#{@user.id}"
  else
    @failed = true
    erb :index
  end
end

get '/login/:user_id' do
  redirect '/' unless current_user
  @urls = current_user.urls
  erb :profile
end

get '/logout' do 
  session.clear
  redirect '/'
end
