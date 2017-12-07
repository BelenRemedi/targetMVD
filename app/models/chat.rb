class Chat < ApplicationRecord
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  delegate :name, to: :sender, prefix: true
  delegate :name, to: :receiver, prefix: true
  belongs_to :topic
  has_many :messages
  after_commit :match_notification, on: [:create]

  def destinatary(current_user)
    current_user.id == receiver_id ? sender_id : receiver_id
  end

  def match_notification
    ActionCable.server.broadcast "notification_channel_user_#{receiver_id}",
                                 user: User.find(receiver_id).name

    ActionCable.server.broadcast "notification_channel_user_#{sender_id}",
                                 user: User.find(sender_id).name
  end
end
