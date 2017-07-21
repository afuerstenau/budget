class Plannedtransaction < ApplicationRecord
  belongs_to :category
  validates :amount, numericality: true
end
