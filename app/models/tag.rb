class Tag < ActiveRecord::Base
  has_many :posts, through: :listings
  has_many :listings
  validates :name, presence: true, uniqueness: true

  def self.parse_create_tags(tag_names)
    tag_names.split(',').map do |name|
        name = name.downcase.strip
        tag = Tag.find_by(name: name)
        tag.nil? ? Tag.create(name: name) : tag
    end
  end

end
