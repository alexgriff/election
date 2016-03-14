
describe 'Vote' do
  
  describe 'factory' do

    it 'has a valid factory' do
      expect(build(:vote)).to be_valid
    end

  end

  describe 'initialization' do

    it 'is invalid for a voter to vote for the same candidate multiple times' do
      vote = create :vote
      voter = vote.voter
      candidate = vote.candidate
      revote = voter.cast_vote_for(candidate)
      revote.valid?

      expect(revote.errors[:voter_id]).to include("The voter cannot cast two votes for the same candidate")
      expect(Vote.all.count).to eq 1
    end

    it 'is invalid for a voter to vote for competing candidates' do
      vote = create :vote
      voter = vote.voter
      candidate1 = vote.candidate
      candidate2 = create(:candidate, position_running_for: candidate1.position_running_for)

      second_vote = voter.reload.cast_vote_for(candidate2)
      expect(second_vote.errors[:voter]).to include("The voter cannot vote for competing candidates")
      expect(Vote.all.count).to eq 1
    end

    it 'is valid for a voter to vote for a state candidate from the same state' do
      expect(build :in_state_vote).to be_valid
    end

    it 'is invalid for a voter to vote for a state candidate from a different state' do

    end
    

  end

end