module CollectsTalksForRendering
  def upcoming_talks
    @upcoming_talks ||= Talk.where.not(claimant_id: nil)
  end
end
