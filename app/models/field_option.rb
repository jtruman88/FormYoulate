class FieldOption < ApplicationRecord
  belongs_to :field
  has_mnay :answers, through: :field_option_answer
end
