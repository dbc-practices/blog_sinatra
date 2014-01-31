class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :author
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :listings do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
  end
end
