require 'spec_helper'

describe CollectsTalksForRendering do
  class FakeCollector
    include CollectsTalksForRendering
  end

  subject(:collector) { FakeCollector.new }
  let!(:claimed_talk) { create_random_claimed_talk }
  let!(:unclaimed_talk) { create_random_unclaimed_talk }
  let(:talks) { collector.send(method_under_test) }

  describe "#upcoming_talks" do
    let(:method_under_test) { :upcoming_talks }
    it "does not include the unclaimed talks" do
      expect(talks).not_to include unclaimed_talk
    end

    it "includes the claimed talks" do
      expect(talks).to include claimed_talk
    end

    it "caches the talks in an instance variable" do
      talks
      expect(collector.instance_variable_get("@upcoming_talks")).to eql talks
    end
  end

  describe '#suggested_talks' do
    let(:method_under_test) { :suggested_talks }
    it "does not include claimed talks" do
      expect(talks).not_to include claimed_talk
    end

    it "includes unclaimed talks" do
      expect(talks).to include unclaimed_talk
    end

    it "caches the suggested_talks in an instance variable" do
      talks
      expect(collector.instance_variable_get("@suggested_talks")).to eql talks
    end
  end
end
