require 'capybara/dsl'

class BBCLogin
  include Capybara::DSL

  USERNAME_FIELD = 'username'
  PASSWORD_FIELD = 'password'
  SIGN_IN_BUTTON = '#submit-button'
  PASSWORD_ERROR = '#form-message-password'
  USERNAME_ERROR = '#form-message-username'
  REGISTER = 'Register'

  # input fields
  def enter_username(username)
    fill_in USERNAME_FIELD, with: username
  end

  def enter_password(password)
    fill_in PASSWORD_FIELD, with: password
  end

  # buttons
  def sign_in_click
    find(SIGN_IN_BUTTON).click
  end

  # links
  def register_click
    click_link(REGISTER)
  end

  # Error messages
  def password_error_message
    find(PASSWORD_ERROR).visible?
  end

  def username_error_message
    find(USERNAME_ERROR).visible?
  end

end
