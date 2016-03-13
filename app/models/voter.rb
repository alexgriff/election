class Voter < ActiveRecord::Base
  has_many :votes
  has_many :candidates, through: :votes

  validates :ssn, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :state, presence: true 
  validate :must_be_18


  def must_be_18
    if !is_18?
      errors.add(:birthdate, "Voter must be 18 years of age")
    end
  end

  def must_be_registered
    errors.add(:registration_status, "Voter is not registered") unless self.registration_status
  end

  def cast_vote_for(candidate)
    self.votes.create(candidate: candidate)
  end

  def register
    if is_18?
      self.registration_status = true
    else 
      self.registration_status = false
    end
    self.save
  end

  def name
    "#{first_name} #{last_name}"
  end

  def is_18?
    Date.today >= (self.birthdate + 18.years)
  end 



end