class HomeController < ApplicationController
  before_action :authenticate_user!
  layout "home"

  def index
    @mainTitle = "Добро пожаловать на вашу личную страницу"
    @mainDesc = "Здесь вы вожете использовать различные блоки и гаджеты."
  end

  def minor
  end
end
