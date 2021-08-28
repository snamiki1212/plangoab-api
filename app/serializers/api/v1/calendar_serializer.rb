# frozen_string_literal: true

class Api::V1::CalendarSerializer < ActiveModel::Serializer
  attributes :id
  has_many :stories, serializer: Api::V1::StorySerializer
  belongs_to :user, serializer: Api::V1::UserSerializer
  belongs_to :visitor, serializer: Api::V1::VisitorSerializer
end
