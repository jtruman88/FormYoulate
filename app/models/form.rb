class Form < ApplicationRecord
  has_many :fields, through: :form_field
end
