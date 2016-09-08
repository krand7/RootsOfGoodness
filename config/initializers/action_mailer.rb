# ActionMailer email configuration
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:               ENV["smtp_address"],
  port:                  ENV["smtp_port"],
  # domain:                ENV["smtp_domain"],
  user_name:             ENV["smtp_user_name"],
  password:              ENV["smtp_password"],
  authentication:        ENV["smtp_authentication"],
  ssl:                   true,
  tls:                   true,
  enable_starttls_auto:  true
}
ActionMailer::Base.default_options = {from: 'noreply@rootsofgoodness.org'}