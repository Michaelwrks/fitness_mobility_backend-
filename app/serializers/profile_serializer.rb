# app/serializers/user_serializer.rb
class ProfileSerializer
    include JSONAPI::Serializer
    attributes :mobility_level, :goals
    has_many :tutorials
  end
  