class Credential
  def self.app_id_key
    Rails.application.secrets.app_id
  end
  def self.app_secret_key
    Rails.application.secrets.app_secret
  end
  def self.sendgrid_password_key
    Rails.application.secrets.sendgrid_password
  end
  def self.sendgrid_username_key
    Rails.application.secrets.sendgrid_username
  end
end
