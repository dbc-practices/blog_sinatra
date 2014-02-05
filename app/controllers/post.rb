# GET METHODS

get '/post/:id' do
  @id = params[:id]
  @post = Post.find(@id)
  @tags = @post.tags.pluck(:name).join(', ')
  erb :show_post
end

get '/edit/:id' do
  @id = params[:id]
  @post = Post.find(@id)
  erb :edit_post
end

get '/delete_confirm/:id' do
  @id = params[:id]
  @title = Post.find(@id).title
  erb :delete_confirm
end

# POST METHODS

post '/create_post' do
  puts params
  # puts params[:tags].empty?
  # redirect to ("/")
  if params[:tags].empty?
    @errors = {tag: ["can't be blank!"]}
    erb :error
  else  
    @post = Post.create_post(params)
    if @post.valid?
      @tags = @post.tags.pluck(:name).join(', ')
      erb :show_post
    else
      @errors = @post.errors.messages
      erb :error
    end
  end
end

 # IF EDIT POST INVALID (return FALSE), print message?

post '/edit_post/:id' do
  @post = Post.update_post(params)
  @tags = @post.tags.pluck(:name).join(', ')
  redirect to ("/post/#{@post.id}")
end

post '/delete/:id' do
  puts params
  if params[:response].nil?
    redirect to ("/post/#{params[:id]}")
  else
    Post.delete_post(params)
    redirect to ('/')
  end
end
