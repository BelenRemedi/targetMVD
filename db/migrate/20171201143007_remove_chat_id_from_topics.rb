class RemoveChatIdFromTopics < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :chat_id, :integer
  end
end
