class Candidate < ActiveRecord::Base
  has_many :votes
  has_many :voters, through: :votes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position_running_for, presence: true
  validate :local_candidate_must_have_state_and_district
  validates_presence_of :state, if: :state_candidate, message: "State Candidate must have a state"

  def local_candidate_must_have_state_and_district
    if self.local_candidate
      errors.add(:local_candidate, "Local Candidate must have a state and a district") unless state.present? && district.present?
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end