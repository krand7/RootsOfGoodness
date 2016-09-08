class ReceiverMailer < ApplicationMailer
	def congrats_email(tribute)
    @tribute = tribute
    @receiver = tribute.receiver
    @url  = 'https://rootsofgoodness.org/'
    mail(to: @receiver.email, subject: 'Your kindness has been recognized')
  end
end
