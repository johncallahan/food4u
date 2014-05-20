require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Login Page", js: true do

  let(:user) { FactoryGirl.create(:user) }

  before { login_as(user, scope: :user) }

  it "shows navigation bar" do
    visit '/'
    page.should have_content('Restaurants')
    page.should have_content('logout')
  end

  it "shows restaurants list" do
    visit '/'
    page.should have_content('Restaurants')
    page.should have_content('logout')
    click_on('Restaurants')
    page.should have_content('Rating')
    page.should have_content('Comment')
  end

end
