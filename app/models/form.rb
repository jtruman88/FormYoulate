class Form < ApplicationRecord
  has_many :submissions
  has_many :fields

  # Creates a new form along with the associated fields and field options
  #
  # @param form_params [ActionController::Parameters] the form data submitted from the new form form
  # @param field_params [Array<ActionController::Parameters>] array of field data submitted from the new form form
  # @return [nil] 
  def self.create_from_form(form_params, field_params)
    form = Form.create(form_params)
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
