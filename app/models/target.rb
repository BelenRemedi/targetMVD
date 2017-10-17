class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  #validates_numericality_of :area
  validates :title, presence: true
  validates :area, presence: true
  validates :area, numericality: true

  validate :max_targets
  #validates_length_of :targets, :maximum => 2

  def max_targets
    errors.add(:targets, "maximum 10 targets") if self.user.targets.size > 2
  end
end
