require 'pages/bbc_homepage'
require 'pages/bbc_login'
require 'pages/bbc_registration_age_check'
require 'pages/bbc_registration_dob'
require 'pages/bbc_registration_user_details'

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

end
