# frozen_string_literal: true

class Api::V1::ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :order
  has_many :events, serializer: Api::V1::EventSerializer
end
