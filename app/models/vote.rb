class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate

  validates :voter_id, presence: true
  validates :candidate_id, presence: true
  validates :voter_id, uniqueness: {scope: :candidate_id, message: "The voter cannot cast two votes for the same candidate"}
  validate :vote_for_one_candidate_for_each_position, :voter_must_be_registered, 
           :voter_must_be_from_same_district_and_state_as_local_candidate,
           :voter_must_be_from_same_state_as_state_candidate,
           :must_be_national_candidate_if_out_of_state_voter

  def vote_for_one_candidate_for_each_position
    self.voter.votes.each do |vote|
      if vote.candidate.position_running_for == self.candidate.position_running_for
        errors.add(:voter, "The voter cannot vote for competing candidates") 
      end
    end  
  end

  def voter_must_be_registered
    if !self.voter.registration_status
      errors.add(:voter, "The voter is not registered to vote")
    end
  end

  def voter_must_be_from_same_district_and_state_as_local_candidate
    if self.candidate.local_candidate
      if (self.voter.district != self.candidate.district) && (self.voter.state != self.candidate.state)
        errors.add(:voter, "A voter must be from the same state and district as a local candidate")
      end
    end
  end

  def voter_must_be_from_same_state_as_state_candidate
    if self.candidate.state_candidate
      if self.voter.state != self.candidate.state
        errors.add(:voter, "A voter must be from a the same state as a state candidate")
      end
    end
  end

  def must_be_national_candidate_if_out_of_state_voter
    if (self.voter.state != self.candidate.state) && !self.candidate.national_candidate 
      errors.add(:voter, "A voter from a different state has to vote for a national candidate")
    end
  end

end