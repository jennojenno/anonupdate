require 'spec_helper'

describe Update do
  before do 
    @update = Update.create
    @update.user_id = 1
    @update.save!
  end 

  it 'exists' do
    expect(@update).to_not be_nil
  end

  context 'associations' do 
    it {should belong_to(:user)}
  end 
 
  it 'belongs to user 1' do 
    expect (@update.user_id).to eq(1)
    puts subject
  end
end
