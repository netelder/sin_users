post '/create_account' do
  @user = User.find_or_create_by_email(:email => params[:email], :full_name => params[:full_name], :password => params[:password])
  if @user
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect "/login/#{@user.id}"
    end
  end
  redirect '/'
end
