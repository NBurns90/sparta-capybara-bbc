require 'spec_helper'

describe "Incorrect user details produces valid error" do

  context "should be able to create a new user" do

    it "Nav to register Page" do
      @bbc_site = BBCSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_login.register_click
      @bbc_site.bbc_registration_age_check.click_over_thirteen
      @bbc_site.bbc_registration_dob.input_day(28)
      @bbc_site.bbc_registration_dob.input_month(10)
      @bbc_site.bbc_registration_dob.input_year(1990)
      @bbc_site.bbc_registration_dob.click_continue
      @bbc_site.bbc_registration_user_details.input_email('Test@testtest.com')
      @bbc_site.bbc_registration_user_details.input_password('Password123')
      @bbc_site.bbc_registration_user_details.input_postcode('RH14HS')
      @bbc_site.bbc_registration_user_details.input_gender('Male')
      @bbc_site.bbc_registration_user_details.input_email_spam_choice('optOut')
      @bbc_site.bbc_registration_user_details.register_submit
      sleep 10
    end

  end

  # context "it should respond with the correct error" do
  #
  #   it "should produce an error when inputting an incorrect password to a valid account" do
  #     @bbc_site = BBCSite.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.sign_in_link_click
  #     @bbc_site.bbc_login.enter_username('natburns@gmail.com')
  #     @bbc_site.bbc_login.enter_password('PASSWORD123')
  #     @bbc_site.bbc_login.sign_in_click
  #     expect(@bbc_site.bbc_login.password_error_message).to be(true)
  #   end
  #
  #   it "should produce an error when inputting an incorrect email with an incorrect password" do
  #     @bbc_site = BBCSite.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.sign_in_link_click
  #     @bbc_site.bbc_login.enter_username('Test@Testtest123.com')
  #     @bbc_site.bbc_login.enter_password('PASSWORD123')
  #     @bbc_site.bbc_login.sign_in_click
  #     expect(@bbc_site.bbc_login.username_error_message).to be(true)
  #   end
  #
  #   it "should produce an error when inputting a correct password and an incorrect email" do
  #     @bbc_site = BBCSite.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.sign_in_link_click
  #     @bbc_site.bbc_login.enter_username('Test@Testtest123.com')
  #     @bbc_site.bbc_login.enter_password('Kenton2810')
  #     @bbc_site.bbc_login.sign_in_click
  #     expect(@bbc_site.bbc_login.username_error_message).to be(true)
  #   end
  #
  #   it "should produce no error when inputting a correct password to a valid account" do
  #     @bbc_site = BBCSite.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.sign_in_link_click
  #     @bbc_site.bbc_login.enter_username('natburns@gmail.com')
  #     @bbc_site.bbc_login.enter_password('Kenton2810')
  #     @bbc_site.bbc_login.sign_in_click
  #     expect(@bbc_site.bbc_homepage.get_home_page).to eq('https://www.bbc.co.uk/')
  #   end
  #
  # end

end
