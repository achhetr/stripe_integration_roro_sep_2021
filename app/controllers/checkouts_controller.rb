class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def gateway
    job = Job.find(params[:job_id])
    
    if job.paid?
      redirect_to jobs_path, alert: "Already purchased! Job cannot be sold"
      return
    end
    
    price_id = price_ids[job.company.capitalize]
    unless price_id.nil?
      # checkout logic
      redirect_to checkout_paid_path(job_id: params[:job_id])
    else
      redirect_to jobs_path, alert: "Invalid Job"
    end
  end
  
  def paid
    job = Job.find(params[:job_id])
    job.update(paid_at: Time.zone.now, user: current_user)
    redirect_to jobs_path, success: "Congratulations Job purchased"
  end
  
  def failed
    redirect_to jobs_path, alert: "OOPS! Payment failed"
  end

  private

  def price_ids
    YAML.load_file(File.join(__dir__, "..", "..", "price_config.yml"))
  end
end
