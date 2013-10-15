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

  describe "Custom Scopes" do
    let!(:claimed_talk) { create_random_claimed_talk }
    let!(:unclaimed_talk) { create_random_unclaimed_talk }

    describe '.claimed' do
      it "includes the claimed talks" do
        expect(Talk.claimed).to include claimed_talk
      end

      it "does not include the unclaimed talks" do
        expect(Talk.claimed).not_to include unclaimed_talk
      end
    end

    describe ".unclaimed" do
      it "includes the unclaimed talks" do
        expect(Talk.unclaimed).to include unclaimed_talk
      end

      it "does not include the unclaimed talks" do
        expect(Talk.unclaimed).not_to include claimed_talk
      end
    end
  end
end
