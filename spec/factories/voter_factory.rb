
FactoryGirl.define do
  
  # Define a Factory
  factory :voter do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    ssn { Faker::Base.numerify('###-##-####') }
    address { Faker::Address.street_address }
    state { Faker::Address.state }
    birthdate { Faker::Date.between(120.years.ago, 18.years.ago) }
    registration_status false
    
    # Traits
    trait :too_young do
      birthdate { Faker::Date.between(17.years.ago, 2.years.ago) }
    end

    # Inherited Factories
    factory :registered_voter do
      # Callbacks
      after(:build) { |voter| voter.register}
    end

  end
end