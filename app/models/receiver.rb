class Receiver < ApplicationRecord
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  has_many :tributes, -> { current }

  # Validations
  validates :name, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
  def complete?
    email.present? && photo.present?
  end
end
