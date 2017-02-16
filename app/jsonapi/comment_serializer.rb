class CommentSerializer < BaseSerializer
  attributes :content
  has_one :post
end
