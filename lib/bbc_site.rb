require 'pages/home/bbc_homepage'
require 'pages/login/bbc_login'
require 'pages/registration/bbc_registration_age_check'
require 'pages/registration/bbc_registration_dob'
require 'pages/registration/bbc_registration_user_details'
require 'pages/account/bbc_account'

class BBCSite

  def bbc_homepage
    BBCHomepage.new
  end

  def bbc_login
    BBCLogin.new
  end

  def bbc_registration_age_check
    BBCRegistrationAgeCheck.new
  end

  def bbc_registration_dob
    BBCRegistrationDOB.new
  end

  def bbc_registration_user_details
    BBCRegistrationUserDetails.new
  end

  def bbc_account
    BBCRegistrationUserDetails.new
  end

end
