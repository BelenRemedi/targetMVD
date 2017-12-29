module Users
  class RegistrationsController < Devise::RegistrationsController

    def confirmation_page; end

    def after_inactive_sign_up_path_for(_resource)
      '/users/registrations/confirmation_page' # Or :prefix_to_your_route
    end

    # GET /resource/edit
     def edit
       respond_to do |format|
         format.js
       end
     end

    # PUT /resource

     def update
       if current_user.update_attributes(account_update_params)
         if is_flashing_format?
           flash_key = update_needs_confirmation?(current_user, current_user.unconfirmed_email) ?
           :update_needs_confirmation : :updated
           set_flash_message :notice, flash_key
         end
         bypass_sign_in current_user, scope: resource_name
         respond_with current_user, location: after_update_path_for(current_user)
       else
         clean_up_passwords current_user
         set_minimum_password_length
         respond_to do |format|
           format.js { render :'edit.js.erb' }
         end
       end
     end

  end
end
