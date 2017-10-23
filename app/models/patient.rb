class Patient < ApplicationRecord
  has_many :encounters
  validates :first_name, :last_name, :mrn, presence: true end
