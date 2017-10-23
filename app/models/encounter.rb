class Encounter < ApplicationRecord
  belongs_to :patient
  validates :visit_number, :admitted_at, :discharged_at, presence: true
end
