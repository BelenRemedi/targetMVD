class AddChatIdToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :chat_id, :integer
  end
end
