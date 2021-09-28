class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def payment
    current_user.set_payment_processor :stripe

    @checkout_session = current_user.payment_processor.checkout(
      mode: "payment",
      line_items: "price_1JeGppGNbRL6fkngsvtL3euE",
      success_url: checkouts_successful_url,
      cancel_url: checkouts_failed_url
      )

    redirect_to @checkout_session.url
  end

  def successful
    flash[:success] = "Congratulations your payment is successful"
    redirect_to jobs_path
  end

  def failed
    flash[:alert] = "OOPS, your payment is failed"
    redirect_to jobs_path
  end
end
