class Form < ApplicationRecord
  belongs_to :user
  has_many :submissions
  has_many :fields

  # Returns all forms except for the given user
  #
  # @param user [User] The user to exclude
  # @return [Array<Form>] 
  scope :all_except_users, ->(user) { where.not(user: user) }

  # Creates a new form along with the associated fields and field options
  #
  # @param form_params [ActionController::Parameters] the form data submitted from the new form form
  # @param field_params [Array<ActionController::Parameters>] array of field data submitted from the new form form
  # @param user [User] The user creating the form
  # @return [nil] 
  def self.create_from_form(form_params, field_params, user)
    form = user.forms.build(form_params)
    form.save
    field_params.each do |field|
      new_field = Field.create(form: form, field_type_id: field[:type], label: field[:label])
      if field[:options].present?
        field[:options].each do |option|
          FieldOption.create(name: option, field: new_field)
        end
      end
    end
  end
end
