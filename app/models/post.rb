class Post < ActiveRecord::Base
  has_many :tags, through: :listings
  has_many :listings
  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true

  def self.create_post(args)
    title = args[:title]
    content = args[:content]
    author = args[:author]
    post = Post.create(title: title, content: content, author: author)
    puts post.valid?
    if post.valid?
      tags = Tag.parse_create_tags(args[:tags])
      puts tags
      tags.each { |tag| post.tags << tag }
      post
    end
  end

  def self.update_post(args)
    post = Post.find(args[:id])
    post.update(  title: args[:title],
                  content: args[:content],
                  author: args[:author] )
    post
  end

  def self.delete_post(args)
    post = Post.find(args[:id])
    post.destroy
  end

end
