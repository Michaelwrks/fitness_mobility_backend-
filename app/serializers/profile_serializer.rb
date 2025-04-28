# app/serializers/user_serializer.rb
class UserSerializer
    include JSONAPI::Serializer
    attributes :mobility_level, :goals
    has_many :tutorials
  end
  