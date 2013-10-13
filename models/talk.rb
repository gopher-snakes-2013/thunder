class Talk < ActiveRecord::Base

  belongs_to :claimant, class_name: "User"

  def claimant_name
    claimed? ? claimant.name : ""
  end

  def claimed?
    !claimant.nil?
  end
end
