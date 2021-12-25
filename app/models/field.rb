class Field < ApplicationRecord
  belongs_to :field_type
  belongs_to :form
  has_many :answers
  has_many :field_options
  has_many :field_option_answers, through: :answers
end
