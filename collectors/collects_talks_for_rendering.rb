module CollectsTalksForRendering
  def upcoming_talks
    @upcoming_talks ||= Talk.claimed
  end

  def suggested_talks
    @suggested_talks ||= Talk.unclaimed
  end
end
