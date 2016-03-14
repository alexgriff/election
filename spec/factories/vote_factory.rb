
FactoryGirl.define do
  
  factory :vote do
    association :candidate
    association :voter, factory: :registered_voter

    factory :in_state_vote do
      state = Faker::Address.state
      association :voter, factory: :registered_voter, state: state
      association :candidate, factory: :state_candidate, state: state
    end
  end
end