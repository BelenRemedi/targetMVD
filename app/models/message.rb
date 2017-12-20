class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  def created_at_time
    created_at.in_time_zone(Time.zone).strftime('%I:%M %p')
  end

  def self.unread_global_messages(current_user)
    where.not(user_id: current_user.id).where(seen: false).count
  end
end
