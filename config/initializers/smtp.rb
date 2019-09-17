ActionMailer::Base.smtp_settings = {
  address: " mocha3024.mochahost.com",
  port: 465,
  domain: 'letsplaytabletop.games',
  user_name: ENV['MOCHA_ADDRESS'],
  password: ENV['MOCHA_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
