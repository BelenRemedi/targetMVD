class Target < ApplicationRecord
  belongs_to :topic
  delegate :name, to: :topic, prefix: true
  belongs_to :user

  validates :title, presence: true
  validates :area, presence: true
  validates :area, numericality: true

  validate :max_targets

  def max_targets
    errors.add(:targets, 'maximum 10 targets') if user.targets.count >= 10
  end
end
