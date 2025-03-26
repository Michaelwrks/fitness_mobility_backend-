# app/serializers/user_serializer.rb
class TutorialSerializer
    include JSONAPI::Serializer
    attributes :name, :category, :format
    has_one :profile, dependent: :destroy
  end
  