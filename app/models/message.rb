class Message < ApplicationRecord
  belongs_to :chat
  scope :for_display, -> { order(:created_at).last(50) }

  # Returns a list of users @mentioned in message content.
  def mentions
    body.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
    puts "username #{username}"
      User.find_by(name: username)
    end.compact
  end
end
