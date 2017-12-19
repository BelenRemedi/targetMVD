module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'
    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      error_key = 'devise.failure.invalid'
    end

   return '' if resource.errors.empty? && flash_alerts.empty? && !flash[:notice]
   errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <!--<h2>#{sentence}</h2>-->
      <ul class= error-list>#{messages}</ul>
    </div>
    HTML

    if flash[:notice]
      html =+ <<-HTML
      <div class="notice">
        <h2>#{flash[:notice]}</h2>
      </div>
      HTML
    end

    html.html_safe
  end
end
