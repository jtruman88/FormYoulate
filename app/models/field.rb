class Field < ApplicationRecord
  belongs_to :field_type
  has_many :forms, through: :form_field
end
