require 'capybara/dsl'

class BBCRegistrationDOB
  include Capybara::DSL

  DAY = 'dateOfBirthDay'
  MONTH = 'dateOfBirthMonth'
  YEAR = 'dateOfBirthYear'
  CONTINUE = '#submit-button'

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

end
