# frozen_string_literal: true

class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  belongs_to :resource, serializer: Api::V1::ResourceSerializer
end
