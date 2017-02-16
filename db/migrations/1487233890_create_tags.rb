# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :tags do
      primary_key :id
      Text :name
      DateTime :created_at, index: true
    end
  end
end
