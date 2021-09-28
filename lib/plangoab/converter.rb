module Plangoab
  class Converter
    def initialize(options = {})
    end

    def self.xxx
      p "OK"
    end
    

    def self.replace_into_attributes_suffix!(obj, params)
      do_replace_into_attributes_suffix!(obj, params, obj)
      # puts "<start", obj, params, ">", ""
      # return if obj.nil?
      # return if params.nil?

      # params.each do |key, val|
      #   new_key = "#{key}_attributes".to_sym
      #   obj[new_key] = obj.delete key

      #   next if val.nil?

      #   if val.is_a? Hash
      #     puts "<is a", obj, ">", ""
      #     # debugger
      #     obj[new_key]&.length&.times do |i|
      #       self.replace_into_attributes_suffix!(obj[new_key][i], params[key])
      #     end
      #     next
      #   end
        
      #   puts "----- throw error"
      # end

    
      # obj
    end

    def self.do_replace_into_attributes_suffix!(obj, params, root)
      puts "<start", "obj:", obj, "params:", params, "root:", root, ">", ""
      return if obj.nil?
      return if params.nil?

      params.each do |key, val|
        new_key = "#{key}_attributes".to_sym
        next if !obj[new_key].nil?
        
        obj[new_key] = obj.delete key
        next if val.nil?

        if val.is_a? Hash
          obj[new_key]&.length&.times do |i|
            self.do_replace_into_attributes_suffix!(obj[new_key][i], params[key], root)
          end
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
  
  