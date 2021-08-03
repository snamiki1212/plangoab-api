table_names = %w(
  companies
)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env.downcase}/#{table_name}.rb")
  return unless File.exist?(path)
  puts "seeding >> #{table_name}..."
  require path
end
