require 'spec_helper'

describe User do
  describe "Jon" do 

    before do 
      @user = User.create(:name => 'Jon')
      @myupdate = Update.create
      @myupdate.myupdate = "Hello world"
      @myupdate.user_id = @user.id
    end 

    it 'exists' do
      expect(@user).to_not be_nil
    end

    context 'associations' do 
      it {should have_many(:friends)}
      it {should have_many(:updates)}
    end 

    # it 'can create an update' do 
    #   @myupdate = Update.new
    #   @myupdate.myupdate = "Hello world"
    #   @myupdate.user_id = @user.id
    # end    

    it 'should have an update associated with it' do 
      @updatecount = Update.where("user_id" => @user.id)
      @updatecount.count.should == 1
    end 

    it 'should know what class it is' do 
      @user.class.should == User
    end 

  end 
end

#Things to test in our User models
# - Can I have 3 friends?
# - Can 2/3 friends have updates?
# - Can I see all my friends' updates? 