module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    private

    def find_verified_user
      verified_user = User.find_by(id: cookies[:user_id])
      if verified_user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
