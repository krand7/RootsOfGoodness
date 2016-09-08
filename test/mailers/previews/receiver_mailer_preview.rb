# Preview all emails at http://localhost:3000/rails/mailers/receiver_mailer
class ReceiverMailerPreview < ActionMailer::Preview
	def congrats_email
		ReceiverMailer.congrats_email(Tribute.first)
	end
end
