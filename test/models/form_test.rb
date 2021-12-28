require "test_helper"

class FormTest < ActiveSupport::TestCase
  test 'self.create_from_form should create form and associated fields and field options' do
    user = users(:john)
    form = Form.create_from_form(form_params, field_params, user)
    assert_instance_of Form, form
    assert_equal field_params.length, form.fields.length
    assert_includes form.fields.last.field_options.pluck(:name), 'Home'
  end

  private

    def form_params
      {
        name: 'test form',
        description: 'a test form'
      }
    end

    def field_params
      [
        {
          label: 'Is this a test?',
          type: FieldType::TEXT
        },
        {
          label: 'Do you like tests?',
          type: FieldType::SINGLE_SELECT,
          options: ['Yes', 'No']
        },
        {
          label: 'Where do you test?',
          type: FieldType::MULTI_SELECT,
          options: ['School', 'Work', 'Home', 'None']
        }
      ]
    end
end
