require 'spec_helper'

describe User do
  describe "#password" do
    # relating to the password method of user
    it { should validate_presence_of(:password) }
    # shoulda matchers from thottbot, they are pretty cool
    # https://github.com/thoughtbot/shoulda-matchers
  end

  describe "#name" do
    it { should validate_presence_of(:name) }
  end

  describe "#email" do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should allow_value("hello@example.com").for(:email) }
    it { should_not allow_value("helloexample.com").for(:email) }
    it { should_not allow_value("hello@examplecom").for(:email) }
  end

  describe ".authenticate" do
    let(:user_attributes) { random_user_attributes }
    # check the spec helper to see the method
    # random_user_attributes
    context "when the user exists" do
      let!(:user) { User.create(user_attributes) }
      # the variable user in this context will be User.create
      # user_attributes (a method from spec helper)
      it "returns the user" do
        expect(User.authenticate(user_attributes)).to eql(user)
        # if autheticate passes it returns the users, otherwise false
      end

      context "and the password is wrong" do
        it "returns false" do
          user_attributes[:password] = "Wrong password"
          expect(User.authenticate(user_attributes)).to be_false
        end
      end
    end

    context "when the user does not exist" do
      it "returns false" do
        expect(User.authenticate(user_attributes)).to be_false
      end
    end
  end
end
