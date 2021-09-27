json.extract! job, :id, :company, :position, :salary, :paid_at, :created_at, :updated_at
json.url job_url(job, format: :json)
