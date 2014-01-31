get '/' do
  @tags = Tag.pluck(:name)
  erb :index
end

post '/create_post' do
  puts params
  @post = Post.create_post(params)
  @tags = @post.tags.pluck(:name).join(', ')
  erb :show_post
end

get '/tag/:tag' do
  # puts params[:tag]
  @tag_name = params[:tag]
  @posts = Tag.find_by(name: @tag_name).posts#.map {|post| post.title}
  # puts @posts[0].title
  erb :list_posts
end

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

post '/edit_post/:id' do
  @post = Post.update_post(params)
  @tags = @post.tags.pluck(:name).join(', ')
  redirect to ("/post/#{@post.id}")
end

get '/delete_confirm/:id' do
  @id = params[:id]
  @title = Post.find(@id).title
  erb :delete_confirm
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



