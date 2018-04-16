class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :coupon_code, null: false
      t.string :morse_code, null: false
      t.references :email
      t.timestamps
    end
  end
end
