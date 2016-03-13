describe 'Candidate' do
  
  it 'can have many voters' do
    candidate = create(:candidate, :with_many_voters)
    expect(candidate.votes.count).to eq(10)

    candidate = create(:candidate, :with_many_voters, number_of_voters: 100)
    expect(candidate.votes.count).to eq(100)
  end

end