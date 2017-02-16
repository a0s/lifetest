class TagSerializer < BaseSerializer
  attributes :name
  has_many :posts
end
