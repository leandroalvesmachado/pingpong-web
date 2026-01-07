class HomeController < ApplicationController
  layout "home"
  before_action :authenticate_usuario!
  def index
  end
end
