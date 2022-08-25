require 'rails_helper'

# input: member data from JSON
# output: Member object with attributes
RSpec.describe Member do
  it 'exists and has proper Member attributes' do
    data = {
      "name": "Joe Neguse",
      "first_name": "Joe",
      "middle_name": nil,
      "last_name": "Neguse",
      "role": "Representative",
      "party": "D",
      "district": "2",
    }
    member = Member.new(data)
    expect(member).to be_a Member
    expect(member.name).to eq(data[:name])
    expect(member.role).to eq(data[:role])
    expect(member.party).to eq(data[:party])
    expect(member.district).to eq(data[:district])
  end
end