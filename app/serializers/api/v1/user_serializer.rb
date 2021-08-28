# frozen_string_literal: true

class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :calendars, serializer: Api::V1::CalendarSerializer
end