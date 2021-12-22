class Field < ApplicationRecord
  belongs_to :field_type
  has_many :answers
  has_many :field_options
  has_many :field_option_answers
  has_many :form_fields
  has_many :forms, through: :form_fields
  has_many :field_option_answers, through: :answers
end
