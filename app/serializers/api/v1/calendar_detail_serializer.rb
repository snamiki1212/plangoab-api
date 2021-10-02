# frozen_string_literal: true

class Api::V1::CalendarDetailSerializer < ActiveModel::Serializer
  attributes :id
  has_many :stories, serializer: Api::V1::StorySerializer
end
