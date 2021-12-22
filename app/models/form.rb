class Form < ApplicationRecord
  has_many :submissions
  has_many :form_fields
  has_many :fields, through: :form_fields
end
