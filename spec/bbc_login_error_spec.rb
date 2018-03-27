require 'spec_helper'

describe "Incorrect user details produces valid error" do

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

  context "should be able to create a new user" do

    it "Username should be " do

    end



  end

end

NOTES
homepage > click sing in link > click register link > 13 or over button click > input day > input month > input year > click button > input email > input password > input postcode > input gender > click button > click register
