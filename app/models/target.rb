class Target < ApplicationRecord
  acts_as_mappable default_units: :kms,
                   lat_column_name: :latitud,
                   lng_column_name: :longitud
  belongs_to :topic
  delegate :name, :id, to: :topic, prefix: true
  belongs_to :user

  validates :title, presence: true
  validates :area, presence: true
  validates :area, numericality: true

  validate :max_targets

  scope :match_topic, ->(topic) { where(topic_id: topic.id) }
  scope :not_for, ->(user) { where.not(user_id: user.id) }
  after_commit :search_for_compatible_targets, on: [:create]

  def max_targets
    errors.add(:targets, 'maximum 10 targets') if user.targets.count >= 10
  end

  def search_for_compatible_targets
    targets = Target.match_topic(topic).not_for(user).within((area.to_f / 1000) * 2, origin: self)
    targets.each do |target|
      Chat.create(receiver_id: target.user_id, sender_id: user.id, topic_id: target.topic_id)
    end
  end
end
