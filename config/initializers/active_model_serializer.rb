# frozen_string_literal: true

ActiveModelSerializers.config.adapter = :json_api # Default: `:attributes`
ActiveModelSerializers.config.key_transform = :camel_lower