# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :comments do
      primary_key :id
      Text :content
      foreign_key :post_id, :posts
      DateTime :created_at, index: true
      DateTime :updated_at, index: true
    end
  end
end
