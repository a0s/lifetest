# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :post_tags do
      foreign_key :post_id, :posts
      foreign_key :tag_id, :tags
      index [:post_id, :tag_id], unique: true
    end
  end
end
