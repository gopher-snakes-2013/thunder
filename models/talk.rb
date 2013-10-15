class Talk < ActiveRecord::Base

  belongs_to :claimant, class_name: "User"
  has_many :notes

  scope :unclaimed, -> { where(claimant_id: nil) }
  scope :claimed, -> { where.not(claimant_id: nil) }

  def claimant_name
    claimed? ? claimant.name : ""
  end

  def claimed?
    !claimant.nil?
  end
end
