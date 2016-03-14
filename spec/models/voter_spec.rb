describe 'Voter' do 

  describe 'factory' do

    it 'has a valid factory' do
      expect(build(:voter)).to be_valid
    end

  end

  describe 'initialization' do

    it 'is invalid without a first name' do
      voter = build(:voter, first_name: nil)
      voter.valid?
      
      expect(voter.errors[:first_name]).to include("can't be blank")
    end
  
    it 'is invalid without a last name' do
      voter = build(:voter, last_name: nil)
      voter.valid?
      
      expect(voter.errors[:last_name]).to include("can't be blank")
    end
  
    it 'is invalid without an address' do
      voter = build(:voter, address: nil)
      voter.valid?
      
      expect(voter.errors[:address]).to include("can't be blank")
    end
  
    it 'is invalid without a state' do
      voter = build(:voter, state: nil)
      voter.valid?
      
      expect(voter.errors[:state]).to include("can't be blank")
    end
  
    it 'is invalid if voter is too young' do
      voter = build(:voter, :too_young)
      voter.valid?
      
      expect(voter.errors[:birthdate]).to include("Voter must be 18 years of age")
    end

  end

  describe 'register' do

    it 'only registers eligible voters' do
      create_list(:registered_voter, 3)
      build :registered_voter, :too_young

      expect(Voter.all.count).to eq(3)
    end

  end

  describe 'cast_vote_for' do

    it 'adds a vote and a candidate to a voter' do
      voter_who_voted = create(:registered_voter)
      voter_who_voted.cast_vote_for(create :candidate)
      
      expect(voter_who_voted.votes.count).to eq(1)
      expect(voter_who_voted.candidates.count).to eq(1)
    end

  end

end