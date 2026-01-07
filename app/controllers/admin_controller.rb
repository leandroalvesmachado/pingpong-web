class AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_usuario!

  def index
  end
end
