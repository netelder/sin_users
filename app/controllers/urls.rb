post '/urls' do
  @url = Url.find_or_create_by_original(original: params[:original], short: Url.gen_hash, click_count: 0)
  if @url.valid? 
    erb :short_link
  else
    erb :index
  end
end

post '/urls/:user_id' do |user_id|
  @url = Url.find_or_create_by_original(original: params[:original], short: Url.gen_hash, click_count: 0, user_id: user_id)
  # if @url.val id?
    @urls = current_user.urls
    erb :profile
  # else
  #   @urls = current_user.urls
  #   erb :profile
  # end
end

get '/:short_url' do |short_url|
  url = Url.where(short: short_url).first
  url.increment(:click_count)
  url.save
  redirect "#{url.original}"
end

get '/delete/:url_id' do |url_id|
  Url.delete(url_id)
  @urls = current_user.urls
  erb :profile
end
