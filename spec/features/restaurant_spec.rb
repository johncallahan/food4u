require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Restaurants Page", js: true do

  let(:user) { FactoryGirl.create(:user) }

  before { login_as(user, scope: :user) }

  it "shows restaurants list" do
    create_list(:restaurant,6)
#    p Restaurant.all
    visit '/'
    click_on('Restaurants')
    page.should have_css("table#rtable tr", :count=>7)
  end

  it "shows correct tags" do
    r1 = create(:restaurant, :tag1)
    r2 = create(:restaurant, :tag2)
#    p Restaurant.all
    visit '/'
    click_on('Restaurants')
    page.should have_content('tag1')
    page.should have_content('tag2')
  end

  it "shows restaurants for tags" do
    page.driver.browser.manage.window.resize_to(2024, 2068)
    r1 = create(:restaurant, :tag1)
    r2 = create(:restaurant, :tag2)
    r3 = create(:restaurant, :tag3)
#    p Restaurant.all
    visit '/'
    click_on('Restaurants')
    page.should have_css("table#rtable tr", :count=>4)
    choose('tag2')
    page.should have_css("table#rtable tr", :count=>2)
    page.should_not have_content('2 of 3')
    page.should have_content('1 of 3')
  end

end
