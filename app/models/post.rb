class Post < Sequel::Model
  one_to_many :comments
  many_to_many :tags, join_table: :post_tags
end
