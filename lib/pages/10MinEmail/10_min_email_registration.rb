require 'capybara/dsl'

class GetTenMinEmail
  include Capybara::DSL

  URL = 'https://www.10minutemail.com/'
  ADDRESS = '#mailAddress'

  def visit_home_page
    visit(URL)
  end

  def get_address
    find(ADDRESS).value
  end

end
