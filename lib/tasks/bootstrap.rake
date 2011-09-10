namespace :bootstrap do 
  desc "Generate coupon codes and how many times they can be used"
  task :coupon_pool => :environment do 
    1000.times  do 
      coupon_code = ActiveSupport::SecureRandom.hex(5)
      if coupon_code.match(/^\D*(\d)\D*(\d)/) != nil
        can_be_used = coupon_code.match(/^\D*(\d)\D*(\d)/).captures.join
      else
        can_be_used = 1
      end
      if can_be_used == 0
        can_be_used = 1
      end 
      Coupon.create( :coupon_code => coupon_code, :times_allowed => can_be_used)
    end
  end
  desc "Run all bootstrapping tasks"
  task :all => [:coupon_pool]
end
