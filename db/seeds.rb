# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Job.destroy_all

Job.create!(
  company: "Tavern",
  title: "Engineer I",
  status: "Interview",
  location: "Remote",
  link: "https://example.com/tavern",
  date_applied: Date.today - 7,
  notes: "Completed assessment and interviewed with Jana."
)

Job.create!(
  company: "Pinterest",
  title: "Software Engineer",
  status: "Applied",
  location: "Remote",
  link: "https://example.com/pinterest",
  date_applied: Date.today - 3,
  notes: "Need to prepare for next step."
)

Job.create!(
  company: "CIBC",
  title: "Software Engineer Apprentice",
  status: "Rejected",
  location: "Chicago, IL",
  link: "https://example.com/cibc",
  date_applied: Date.today - 14,
  notes: "Good learning experience."
)