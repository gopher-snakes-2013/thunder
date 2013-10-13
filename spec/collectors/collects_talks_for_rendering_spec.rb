require 'spec_helper'

describe CollectsTalksForRendering do
  class FakeCollector
    include CollectsTalksForRendering
  end

  subject(:collector) { FakeCollector.new }
  describe ".upcoming_talks" do
    it "is empty when no talks are claimed" do

      create_random_unclaimed_talk
      create_random_unclaimed_talk
      create_random_unclaimed_talk

      talks = collector.upcoming_talks

      expect(talks).to be_empty
    end
  end

  it "includes the claimed talks" do
    create_random_unclaimed_talk
    create_random_unclaimed_talk
    claimed_talk = create_random_claimed_talk

    talks = collector.upcoming_talks

    expect(talks).to include claimed_talk
  end

  it "caches the talks in an instance variable" do
    create_random_unclaimed_talk
    claimed_talk = create_random_claimed_talk

    talks = collector.upcoming_talks

    expect(collector.instance_variable_get("@upcoming_talks")).to eql talks
  end

end
