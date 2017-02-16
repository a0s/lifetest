class PostSerializer < BaseSerializer
  attributes :title, :content
  has_many :comments
  has_many :tags
end
