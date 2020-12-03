class Automorph < ApplicationRecord
  validates :input, presence: true, numericality: { greater_than_or_equal_to: 1 }, uniqueness: true
  validates :result, presence: true
end
