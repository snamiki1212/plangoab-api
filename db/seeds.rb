# Factory
require 'factory_bot'
include FactoryBot::Syntax::Methods
FactoryBot.definition_file_paths = [ Rails.root.join('spec/factories') ]
FactoryBot.reload

# Load each seeds
table_names = %w(
  calendar
  resource
  event
  
  company
  user
)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env.downcase}/#{table_name}.rb")
  return unless File.exist?(path)
  puts "seeding >> #{table_name}..."
  require path
end
