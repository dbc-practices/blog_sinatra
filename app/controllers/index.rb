get '/' do
  @tags = Tag.pluck(:name)
  erb :index
end
