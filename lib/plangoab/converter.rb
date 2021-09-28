module Plangoab
  class Converter
    def initialize(options = {})
    end

    def self.xxx
      p "OK"
    end
    

    def self.replace_into_attributes_suffix!(obj, params)
      
      params.each do |key, val|
        if val.nil?
          obj["#{key}_attributes".to_sym] = obj.delete key.to_sym
          next
        end
        if val.is_a? Symbol
          obj["#{key}_attributes".to_sym] = obj.delete key.to_sym
          self.replace_into_attributes_suffix!(obj, [key])
        end
        if val.is_a? Hash
        end
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
  
  