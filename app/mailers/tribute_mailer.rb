class TributeMailer < ApplicationMailer
	def thank_you_email(tribute)
    @tribute = tribute
    @url  = 'https://rootsofgoodness.org/'
    mail(to: @tribute.email, subject: 'Thank you')
  end
end
