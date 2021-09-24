# frozen_string_literal: true

class Api::V1::StorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :resources, serializer: Api::V1::ResourceSerializer
end
