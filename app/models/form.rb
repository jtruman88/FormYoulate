class Form < ApplicationRecord
  has_many :submissions
  has_many :fields
end
