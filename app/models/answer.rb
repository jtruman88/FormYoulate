class Answer < ApplicationRecord
  belongs_to :field
  belongs_to :submission
  has_many :field_options, through: :field_option_answer
end
