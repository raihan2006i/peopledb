AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

100.times do
  Person.find_or_create_by({
                               name: Faker::Name.name,
                               email: Faker::Internet.email,
                               blood_group: Person::BLOOD_GROUPS.sample,
                               profession: Faker::Name.title,
                               address: Faker::Address.street_address,
                               phone: Faker::PhoneNumber.phone_number,
                               approved: true,
                           })
end