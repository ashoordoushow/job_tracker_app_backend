class Job < ApplicationRecord
  validates :company, :title, :status, presence: true
end