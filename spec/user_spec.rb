require 'spec_helper'

describe User do
  describe "#password" do
    it { should validate_presence_of(:password) }
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
end
