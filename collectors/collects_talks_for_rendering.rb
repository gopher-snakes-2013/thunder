module CollectsTalksForRendering
  def upcoming_talks
    @upcoming_talks ||= Talk.claimed.select { |t| t.notes.empty? }
  end

  def suggested_talks
    @suggested_talks ||= Talk.unclaimed
  end

  def completed_talks
    @completed_talks ||= Talk.claimed.reject { |t| t.notes.empty? }
  end
end
