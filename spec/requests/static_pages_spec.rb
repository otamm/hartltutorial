#require 'spec_helper'

#describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end
require 'spec_helper'
RSpec.configure do |config|
  config.include Capybara::DSL


  describe "Static pages" do

    describe "Home page" do

      it "should have the content 'Sample App' and title 'Home' " do
        visit static_pages_home_path
        expect(page).to have_content('Another Sample App')
        expect(page).to have_title('Home')
      end
    end

    describe "Help page" do
      it "should have the content/title 'Help' " do
        visit static_pages_help_path
        expect(page).to have_content('Help')
        expect(page).to have_title('Help')
      end
    end

    describe "About page" do
      it "should have the content/title 'About us' " do
        visit static_pages_about_path
        expect(page).to have_content('About us')
        expect(page).to have_title('About Us')
      end
    end

    describe "Contact page" do
      it "should have the content 'Contact' " do
        visit static_pages_contact_path
        expect(page).to have_content('Contact Info')
      end

      it "should have the title 'Contact' " do
        visit static_pages_contact_path
        expect(page).to have_title('Contact')
      end
    end
  end
end
