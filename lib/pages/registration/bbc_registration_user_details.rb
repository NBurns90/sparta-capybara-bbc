require 'capybara/dsl'

class BBCRegistrationUserDetails
  include Capybara::DSL

  EMAIL = 'email'
  PASSWORD = 'password'
  POSTCODE = 'postcode'
  GENDER = 'gender'
  OPT_IN = '//*[@id="marketingOptIn"]/div[1]/div[1]/label/div'
  OPT_OUT = '//*[@id="marketingOptIn"]/div[1]/div[2]/label/div'
  REGISTER = '#submit-button'
  GET_EMAIL = '#user-identifier-input'
  EMAIL_ERROR = '#form-message-email'
  GET_PASSWORD = '#password-input'
  PASSWORD_ERROR = '#form-message-password'
  GET_POSTCODE = '#postcode-input'
  GET_GENDER = '#gender-input'

  # inputs
  def input_email(email)
    fill_in(EMAIL, with: email)
  end

  def input_password(password)
    fill_in(PASSWORD, with: password)
  end

  def input_postcode(postcode)
    fill_in(POSTCODE, with: postcode)
  end

  def input_gender(gender)
    select(gender, :from => GENDER)
  end

  def input_email_spam_choice(choice)
    if choice == 'optIn'
      # click('No, thanks')
      find(:xpath, OPT_IN).click
    elsif choice == 'optOut'
      # choose('Yes, please')
      find(:xpath, OPT_OUT).click
    else
      throw
    end
  end

  # click button to complete registration
  def register_submit
    find(REGISTER).click
  end

  # Gets
  def get_email
    find(GET_EMAIL).value
  end

  def get_email_error
    find(EMAIL_ERROR).visible?
  end

  def get_password
    find(GET_PASSWORD).value
  end

  def get_password_error
    find(PASSWORD_ERROR).visible?
  end

  def get_postcode
    find(GET_POSTCODE).value
  end

  def get_gender
    find(GET_GENDER).value
  end

  def get_url
    current_url
  end

end
