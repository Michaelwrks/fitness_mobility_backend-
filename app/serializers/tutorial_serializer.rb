# app/serializers/user_serializer.rb
class TutorialSerializer
    include JSONAPI::Serializer
    attributes :name, :category, :format
    has_many :profile_tutorials
    has_many :profiles, through: :profile_tutorials  
  end
  