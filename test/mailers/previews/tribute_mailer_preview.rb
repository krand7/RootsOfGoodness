# Preview all emails at http://localhost:3000/rails/mailers/tribute_mailer
class TributeMailerPreview < ActionMailer::Preview
	def thank_you_email
		TributeMailer.thank_you_email(Tribute.first)
	end
end
