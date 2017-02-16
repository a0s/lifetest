class BaseSerializer
  include JSONAPI::Serializer

  def self_link
    "/#{super}"
  end
end
