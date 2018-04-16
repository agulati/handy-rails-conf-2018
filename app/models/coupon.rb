class Coupon < ApplicationRecord
  belongs_to :email
  validates :coupon_code, presence: true, uniqueness: true

  scope :available, -> { where(email_id: nil) }

  def self.next_available (email:)
    next_coupon = Coupon.available.first

    if next_coupon
      next_coupon.with_lock do
        next_coupon.email = email
        next_coupon.save!
      end
    end

    next_coupon
  end
end
