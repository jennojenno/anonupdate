require 'spec_helper'

describe User do
  it 'exists' do
    user = User.create
    expect(user).to_not be_nil
  end

  context 'associations' do 
    it {should have_many(:friends)}
    it {should have_many(:updates)}
  end 

  it 'can create an update' do 
    @myupdate = Update.new
    @myupdate.myupdate = "Hello world"
    @myupdate.save
  end    

  it 'has an update associated with my id' do 
    puts subject
    expect (@myupdate.user_id).to eq(1)
  end  
end
