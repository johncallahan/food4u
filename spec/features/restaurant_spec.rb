require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Restaurants Page", js: true do

  let(:user) { FactoryGirl.create(:user) }

  before { login_as(user, scope: :user) }

  it "shows restaurants list" do
    create_list(:restaurant,2)
#    p Restaurant.all
    visit '/'
    click_on('Restaurants')
    page.should have_content('FoodShack1')
    page.should have_content('FoodShack2')
  end

end
