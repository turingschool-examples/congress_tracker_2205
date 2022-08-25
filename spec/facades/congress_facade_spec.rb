require 'rails_helper'

# input: state variable
# output: array of member objects
RSpec.describe 'CongressFacade' do
  it 'returns an array of member objects', :vcr do
    members = CongressFacade.members('CO')

    expect(members).to be_a Array
    expect(members).to be_all Member
  end
end