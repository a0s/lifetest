require 'json'

class LifeServer < Sinatra::Base
  configure do
    mime_type :api_json, 'application/vnd.api+json'
    set :database, DB
  end

  helpers do
    def parse_request_body
      return unless request.body.respond_to?(:size) && request.body.size > 0
      halt 415 unless request.content_type && request.content_type[/^[^;]+/] == mime_type(:api_json)
      request.body.rewind
      JSON.parse(request.body.read, symbolize_names: true)
    end

    # Convenience methods for serializing models:
    def serialize_model(model, options = {})
      options[:is_collection] = false
      options[:skip_collection_check] = true
      JSONAPI::Serializer.serialize(model, options)
    end

    def serialize_models(models, options = {})
      options[:is_collection] = true
      JSONAPI::Serializer.serialize(models, options)
    end
  end

  before do
    pp request.preferred_type.entry
    pp mime_type(:api_json)
    halt 406 unless request.preferred_type.entry == mime_type(:api_json)
    @data = parse_request_body
    content_type :api_json
  end

  get '/posts' do
    posts = Post.all
    serialize_models(posts).to_json
  end

  get '/posts/:id' do
    post = Post[params[:id].to_i]
    not_found if post.nil?
    serialize_model(post, include: 'comments').to_json
  end
end
