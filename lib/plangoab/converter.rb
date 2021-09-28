module Plangoab
  class Converter

    def self.convert_into_attributes_suffix!(obj, params)
      return if obj.nil?
      return if params.nil?

      params.each do |key, val|
        new_key = "#{key}_attributes".to_sym
        next if !obj[new_key].nil?
        
        obj[new_key] = obj.delete key
        next if val.nil?

        if val.is_a? Hash
          obj[new_key]&.length&.times do |i|
            self.convert_into_attributes_suffix!(obj[new_key][i], params[key])
          end
        end
      end

      obj
    end
  end
end
