class Job < ApplicationRecord
  belongs_to :user, optional: true

  def paid?
    paid_at.present?
  end
end
