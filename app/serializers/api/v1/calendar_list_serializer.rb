# frozen_string_literal: true

class Api::V1::CalendarListSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user, serializer: Api::V1::UserSerializer
  belongs_to :visitor, serializer: Api::V1::VisitorSerializer
end
