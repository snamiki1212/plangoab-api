10.times do |n|
  name = "user_#{n}"
  license_key = "license-key-#{n}"
  Company.new(name: name, license_key: license_key).save!
end
