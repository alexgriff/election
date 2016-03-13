require 'faker'

positions = %W(President Governor Mayor Senator Representative State\sSenator State\sRepresentative Attorney\sGeneral Council\sMember Dog\sCatcher County\sCoroner School\sBoard\sCommittee\sMember Lieutenant\sGovernor County\sAuditor Assembly\sPerson Commissioner Common\sPleas\sCourt\sJudge Clerk\sof\sCourt City\sAlderman Village\sTrustee County\sExecutive)
natures = %w(Hardy Lonely Brave Adamant Naughty Bold Docile Relaxed Impish Lax Timid Hasty Serious Jolly Naive Modest Mild Quiet Bashful Rash Calm Gentle Sassy Careful Quirky)


FactoryGirl.define do

  factory :candidate do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position_running_for { positions.sample }
    personality_type { natures.sample(rand(2..4)).join(", ")}
    bio { Faker::Lorem.paragraph }
    national_candidate true

    factory :state_candidate do
      national_candidate false
      state_candidate true
      state { Faker::Address.state }
    end

    trait :with_many_voters do
      
      transient do
        number_of_voters 10
      end

      after(:create) do |candidate, evaluator|
        create_list(:vote, evaluator.number_of_voters, candidate: candidate)
      end

    end

  end
end



