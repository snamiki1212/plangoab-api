# frozen_string_literal: true

class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :background_color, :started_at, :ended_at
end
