require 'sequel'

Sequel.extension :migration
Sequel::Model.plugin :timestamps, update_on_create: true
Sequel::Model.plugin :tactical_eager_loading

ENV['DB'] ||= App.default_db
DB = Sequel.connect(ENV['DB'])
