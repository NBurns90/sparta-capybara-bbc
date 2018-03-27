require 'capybara/dsl'

class BBCRegistrationUserDetails
  include Capybara::DSL

  EMAIL = '#user-identifier-input'
  PASSWORD = '#password-input'
  POSTCODE = '#postcode-input'
  GENDER = '#gender-input'
  OPT_IN = 'optIn'
  OPT_OUT = '#optOut'
  SUMBIT = '#submit-button'

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
    select(gender, :from => GENDER
  end

  def input_email_spam_choice(choice)
    if choice == 'optIn'
      click(OPT_IN)
    elsif choice == 'optOut'
      click(OPT_OUT)
    else
      break
    end
  end

  def register_submit
    click(Submit)
  end

end
