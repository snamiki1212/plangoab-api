module Plangoab
  class Converter
    def initialize(options = {})
    end

    def self.xxx
      p "OK"
    end
    

    def self.replace_into_attributes_suffix!(obj, params)
      return if obj.is_a? nil
      params.each do |key, val|
        if val.nil?
          # debugger
          puts "val is nil", key, 99
          debugger
          obj["#{key}_attributes".to_sym] = obj.delete key.to_sym
          next
        end

        if val.is_a? Hash
          puts "call recur"
          self.replace_into_attributes_suffix!(obj[key], val)
          # debugger
          obj["#{key}_attributes".to_sym] = obj.delete key
        end
        # if val.is_a? Hash
        # end
      end
    
      obj
    end
  end
end


  # # ------------------------------
  # {
  #   :stories => [
  #     :reosurces => [
  #       :events => [
  #         //...
  #       ]
  #     ]
  #   ]
  # }
  
  # // ------------------------
  
  # [
  #   :stories_attributes => [
  #     :reosurces_attributes => [
  #       :events_attributes => [
  #         //...
  #       ]
  #     ]
  #   ]
  # ]
  
  # // -- // -- // -- // -- // -- // -- // -- //
  
  # obj, { stories: {resources: :events} }
  
  