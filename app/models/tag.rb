class Tag < Sequel::Model
  many_to_many :posts, join_table: :post_tags
end
