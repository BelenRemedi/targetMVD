class Chat < ApplicationRecord
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  delegate :name, to: :sender, prefix: true
  delegate :name, to: :receiver, prefix: true
  belongs_to :topic
  has_many :messages

  def destinatary(current_user)
    current_user.id == receiver_id ? sender_id : receiver_id
  end
end
