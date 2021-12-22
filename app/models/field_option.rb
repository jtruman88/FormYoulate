class FieldOption < ApplicationRecord
  belongs_to :field
  has_many :field_option_answers
  has_many :answers, through: :field_option_answers
end
