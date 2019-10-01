class TestMailer < ActionMailer::Base
  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'recipient@example.com',
      :from => 'sender@example.com',
      :html_body => 'HTML body goes here',
      :track_opens => 'true')
  end
end
