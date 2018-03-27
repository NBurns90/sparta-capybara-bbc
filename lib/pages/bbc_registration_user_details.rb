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

  def register_submit
    find(REGISTER).click
  end

end
