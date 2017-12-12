module ApplicationHelper
  def unread_messages_count(results, chat)
    if results[chat.id] > 0
      render 'unread_msg', chat: chat, results: results
    end
  end
end
