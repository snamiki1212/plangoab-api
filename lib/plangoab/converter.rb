module Plangoab
  class Converter

    def self.convert_into_attributes_suffix!(obj, scheme)
      return if obj.nil?
      return if scheme.nil?

      scheme.each do |key, val|
        new_key = "#{key}_attributes".to_sym
        next if !obj[new_key].nil?
        
        obj[new_key] = obj.delete key
        next if val.nil?

        if val.is_a? Hash
          obj[new_key]&.length&.times do |i|
            self.convert_into_attributes_suffix!(obj[new_key][i], scheme[key])
          end
        end
      end

      obj
    end
  end
end
