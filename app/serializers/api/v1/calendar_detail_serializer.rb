# frozen_string_literal: true

class Api::V1::CalendarDetailSerializer < ActiveModel::Serializer
  attributes :id
  # has_many :stories, serializer: Api::V1::StorySerializer
  
  
  has_many :stories

  class StorySerializer < ActiveModel::Serializer
    attributes :id, :title
    has_many :resources
    
    class ResourceSerializer < ActiveModel::Serializer
      attributes :id, :title, :order
      has_many :events

      class EventSerializer < ActiveModel::Serializer
        attributes :id, :description, :title
      end
      
    end
    
  end


end
