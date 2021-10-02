# frozen_string_literal: true

module Plangoab
  class Converter
    def self.append_attributes_suffix!(obj, scheme)
      return if obj.nil?
      return if scheme.nil?

      do_append_attributes_suffix!(obj, scheme)
      obj
    end

    def self.do_append_attributes_suffix!(obj, scheme)
      scheme.each do |key, val|
        new_key = "#{key}_attributes".to_sym
        next unless obj[new_key].nil?

        obj[new_key] = obj.delete key
        next if val.nil?
        next unless val.is_a? Hash

        obj[new_key]&.length&.times do |i|
          append_attributes_suffix!(obj[new_key][i], scheme[key])
        end
      end
    end
  end
end
