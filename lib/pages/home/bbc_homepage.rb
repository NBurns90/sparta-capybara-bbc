require 'capybara/dsl'

class BBCHomepage
  include Capybara::DSL

  HOMEPAGE_URL = 'https://www.bbc.co.uk/'
  SIGN_IN_LINK_ID = '#idcta-username'

  def visit_home_page
    visit(HOMEPAGE_URL)
  end

  def get_home_page
    current_url
  end

  def sign_in_link
    find(SIGN_IN_LINK_ID)
  end

  def sign_in_link_click
    sign_in_link.click
  end

end
