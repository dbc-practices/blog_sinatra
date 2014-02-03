get '/tag/:tag' do
  @tag_name = params[:tag]
  @posts = Tag.find_by(name: @tag_name).posts
  erb :list_posts
end
