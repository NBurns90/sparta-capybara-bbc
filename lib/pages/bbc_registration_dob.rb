require 'capybara/dsl'

class BBCRegistrationDOB
  include Capybara::DSL

  DAY = 'dateOfBirthDay'
  MONTH = 'dateOfBirthMonth'
  YEAR = 'dateOfBirthYear'
  GET_DAY = '#day-input'
  GET_MONTH = '#month-input'
  GET_YEAR = '#year-input'
  CONTINUE = '#submit-button'

  # inputs
  def input_day(day)
    fill_in(DAY, with: day)
  end

  def input_month(month)
    fill_in(MONTH, with: month)
  end

  def input_year(year)
    fill_in(YEAR, with: year)
  end

  def click_continue
    find(CONTINUE).click
  end

  # Gets
  def get_day
    find(GET_DAY).value
  end

  def get_month
    find(GET_MONTH).value
  end

  def get_year
    find(GET_YEAR).value
  end

  def get_url
    current_url
  end

end
