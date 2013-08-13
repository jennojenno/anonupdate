require 'spec_helper'

describe Update do
  before do 
    @user = User.create(:name => 'Jon')
    @myupdate = Update.create
    @myupdate.myupdate = "Hello world"
    @myupdate.user_id = @user.id
  end 

  it 'exists' do
    expect(@myupdate).to_not be_nil
  end

  context 'associations' do 
    it {should belong_to(:user)}
  end 
 
end


#Things to test for Update models... 
- Can we get the correct update as user Jon? 
- 