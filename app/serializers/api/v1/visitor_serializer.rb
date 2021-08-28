# frozen_string_literal: true

class Api::V1::VisitorSerializer < ActiveModel::Serializer
  attributes :id, :birthday
  has_many :calendars
end