require "yaml"

YAML.load_file("#{Rails.root}/db/seed/coupons.yml").each { |coupon| Coupon.create!(coupon) }
