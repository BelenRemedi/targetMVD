module Users
  class PasswordsController < Devise::PasswordsController

    # POST /resource/password
    def create
      resource = User.send_reset_password_instructions(resource_params)
      if successfully_sent?(resource)
        respond_with resource, location: new_user_session_url
      else
        respond_to do |format|
          format.js { flash[:error] = 'Email not found' }
        end
      end
   end

  end
end
