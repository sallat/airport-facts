#module for helping controller specs
module ValidUserHelper
  def signed_in_as_a_valid_user
    @user = FactoryGirl.create(:user)
    sign_in @user # method from devise:TestHelpers
  end
end

module ValidAdminHelper
  def signed_in_as_a_valid_admin
    @admin = FactoryGirl.create(:admin)
    sign_in @admin 
  end
end

RSpec.configure do |config|
  config.include ValidUserHelper, :type => :controller
  config.include ValidAdminHelper, :type => :controller
end