get '/' do
  @tags = Tag.pluck(:name).sort
  erb :index
end
