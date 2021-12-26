class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :submissions
  has_many :forms

  # Checks if the form was created by the given user
  #
  # @param form [Form] The form to check
  # @return [Boolean] 
  def owns_form?(form)
    self == form.user
  end
end
