require 'spec_helper'

describe "Incorrect user details produces valid error" do

  context "should be able to create a new user" do

    before(:all) do
      @address = TenMinuteEmailSite.new
      @address.ten_minute_email_registation.visit_home_page
      @storedemail = @address.ten_minute_email_registation.get_address
      @bbc_site = BBCSite.new
      @bbc_site.bbc_homepage.visit_home_page
    end

    it "should click on the register link and take you to the age verification page" do
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_login.register_click
    end

    it "selecting over the age of the 13 should take you to the DOB input page" do
      @bbc_site.bbc_registration_age_check.click_over_thirteen
    end

    it "dob should be be equal to the passed input" do
      @bbc_site.bbc_registration_dob.input_day(28)
      expect(@bbc_site.bbc_registration_dob.get_day).to eq('28')
      @bbc_site.bbc_registration_dob.input_month(10)
      expect(@bbc_site.bbc_registration_dob.get_month).to eq('10')
      @bbc_site.bbc_registration_dob.input_year(1990)
      expect(@bbc_site.bbc_registration_dob.get_year).to eq('1990')
    end

    it "clicking the continue link should take you the user details input page" do
      @bbc_site.bbc_registration_dob.click_continue
    end

    # email
    it "email should equal the passed input" do
      @bbc_site.bbc_registration_user_details.input_email(@storedemail)
      expect(@bbc_site.bbc_registration_user_details.get_email).to eq(@storedemail)
    end

    # it "invalid email input should return an error" do
    #   expect(@bbc_site.bbc_registration_user_details.get_email_error).to eq(False)
    # end

    # password
    it "password should equal the passed password" do
      @bbc_site.bbc_registration_user_details.input_password('Password123')
      expect(@bbc_site.bbc_registration_user_details.get_password).to eq('Password123')
    end

    # it "invalid password input should return an error" do
      # expect(@bbc_site.bbc_registration_user_details.get_password_error).to eq(False)
    # end

    # postcode
    it "postcode input should equal the passed postcode" do
      @bbc_site.bbc_registration_user_details.input_postcode('RH14HS')
      expect(@bbc_site.bbc_registration_user_details.get_postcode).to eq('RH14HS')
    end

    # gender
    it "gender should equal the passed gender value" do
       @bbc_site.bbc_registration_user_details.input_gender('Male')
       expect(@bbc_site.bbc_registration_user_details.get_gender).to eq('male')
    end

    it "gender should not be default" do
      expect(@bbc_site.bbc_registration_user_details.get_gender).not_to eq('please select')
    end

    it "complete registration" do
      @bbc_site.bbc_registration_user_details.input_email_spam_choice('optOut')
      @bbc_site.bbc_registration_user_details.register_submit
    end

    it "once completed, should sign you out" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_account.sign_out
    end

  end

  context "it should respond with the correct error" do

    it "should produce an error when inputting an incorrect password to a valid account" do
      @bbc_site = BBCSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_login.enter_username('natburns@gmail.com')
      @bbc_site.bbc_login.enter_password('PASSWORD123')
      @bbc_site.bbc_login.sign_in_click
      expect(@bbc_site.bbc_login.password_error_message).to be(true)
    end

    it "should produce an error when inputting an incorrect email with an incorrect password" do
      @bbc_site = BBCSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_login.enter_username('Test@Testtest123.com')
      @bbc_site.bbc_login.enter_password('PASSWORD123')
      @bbc_site.bbc_login.sign_in_click
      expect(@bbc_site.bbc_login.username_error_message).to be(true)
    end

    it "should produce an error when inputting a correct password and an incorrect email" do
      @bbc_site = BBCSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_login.enter_username('Test@Testtest123.com')
      @bbc_site.bbc_login.enter_password('Kenton2810')
      @bbc_site.bbc_login.sign_in_click
      expect(@bbc_site.bbc_login.username_error_message).to be(true)
    end

    it "should produce no error when inputting a correct password to a valid account" do
      @bbc_site = BBCSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.sign_in_link_click
      @bbc_site.bbc_login.enter_username('natburns@gmail.com')
      @bbc_site.bbc_login.enter_password('Kenton2810')
      @bbc_site.bbc_login.sign_in_click
      expect(@bbc_site.bbc_homepage.get_home_page).to eq('https://www.bbc.co.uk/')
    end

  end

end
