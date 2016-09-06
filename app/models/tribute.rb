class Tribute < ApplicationRecord
  # Default Scope
  # Constants
  STATUS = [['Pending', 'pending'], ['Approved', 'approved']]

  # Attribute related macros
  # Associations
  belongs_to :receiver

  # Validations
  validates :description, presence: true
  validates :created_by, presence: true
  validates :email, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
  def charge_trees(token, num_trees)
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = ENV["stripe_api_key"]

    # Get the number of trees and update model
    update(trees: self.trees + num_trees)
    receiver.update(trees: receiver.trees + num_trees)

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => num_trees*100, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => "Example charge"
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
