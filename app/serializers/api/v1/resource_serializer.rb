# frozen_string_literal: true

class Api::V1::ResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_border_color, :field, :order
  has_many :events, serializer: Api::V1::EventSerializer
end
