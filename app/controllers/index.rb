get '/' do
  erb :index
end

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
  erb :profile
end

post '/create_account' do
  @user = User.find_or_create_by_email(:email => params[:email], :full_name => params[:full_name], :password => params[:password])
  if @user
    @user = User.authenticate(params[:email], params[:password])
  end
  if @user
    session[:user_id] = @user.id
    redirect "/login/#{@user.id}"
  else
    redirect '/'
  end
end

get '/logout' do 
  session.clear
  redirect '/'
end

get '/secret' do
  redirect '/' unless current_user
  erb :secret
end

