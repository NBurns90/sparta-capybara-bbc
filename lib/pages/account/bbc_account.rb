require 'capybara/dsl'

class BBCAccountPage
  include Capybara::DSL

  URL = 'https://account.bbc.com/account'
  SIGN_OUT = 'Sign out'

  def sign_out
    click_link('Sign out')
  end

end
