# frozen_string_literal: true

class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :started_at, :ended_at
end
