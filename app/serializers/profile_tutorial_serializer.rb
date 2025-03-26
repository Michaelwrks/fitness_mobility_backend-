# app/serializers/user_serializer.rb
class ProfileTutorialSerializer
    include JSONAPI::Serializer
    attributes 
    belongs_to :profile
    belongs_to :tutorial  
end
  