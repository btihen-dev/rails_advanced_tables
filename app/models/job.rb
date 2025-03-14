class Job < ApplicationRecord
  belongs_to :company

  has_many :character_jobs, dependent: :destroy
  has_many :people, through: :character_jobs

  normalizes :role, :title, :company, with: ->(value) { value.strip }

  validates :company, presence: true
  validates :role, presence: true
  validates :role,
            uniqueness: { scope: :company_id,
                          message: "role and company already exists" }
end
