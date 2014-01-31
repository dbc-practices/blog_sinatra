class Tag < ActiveRecord::Base
  has_many :posts, through: :listings
  has_many :listings
  validates :name, presence: true, uniqueness: true

  # def self.create_tag(tag_name)

  # end
end
