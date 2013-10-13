require 'spec_helper'

describe Talk do
  it { should belong_to(:claimant) }

  context "when the talk is claimed" do
    subject(:talk) { create_random_claimed_talk }
    its(:claimant_name) { should eql talk.claimant.name }
    it { should be_claimed }
  end

  context "when the talk is unclaimed" do
    its(:claimant_name) { should eql "" }
    it { should_not be_claimed }
  end
end
