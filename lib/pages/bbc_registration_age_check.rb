require 'capybara/dsl'

class BBCRegistrationAgeCheck
  include Capybara::DSL

  UNDER_13 = 'Under 13'
  OVER_13 = '13 or over'

  def click_over_thirteen
    click(OVER_13)
  end

end
