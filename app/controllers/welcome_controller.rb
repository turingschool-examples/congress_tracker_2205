class WelcomeController < ApplicationController
  def index
    cookies.encrypted[:secret_message] = "cookies are delicious"
  end
end
