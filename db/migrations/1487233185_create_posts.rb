# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      Text :title
      Text :content
      DateTime :created_at, index: true
      DateTime :updated_at, index: true
    end
  end
end
