require 'capybara/dsl'

class BBCRegistrationDOB
  include Capybara::DSL

  DAY = '#day-input'
  MONTH = '#month-input'
  YEAR = '#year-input'
  SUBMIT = '#submit-button'

  def input_day(day)
    fill_in(DAY, with: day)
  end

  def input_day(month)
    fill_in(MONTH, with: month)
  end

  def input_day(year)
    fill_in(YEAR, with: year)
  end

  def click_continue
    click(SUBMIT)
  end

end
