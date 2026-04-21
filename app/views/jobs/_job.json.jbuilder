json.extract! job, :id, :company, :title, :status, :location, :link, :date_applied, :notes, :created_at, :updated_at
json.url job_url(job, format: :json)
