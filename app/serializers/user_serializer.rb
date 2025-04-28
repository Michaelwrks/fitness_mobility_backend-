# app/serializers/user_serializer.rb
class UserSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :email, :age, 
    has_one :profile
  end
  