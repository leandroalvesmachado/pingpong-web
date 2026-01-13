class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  include Pagy::Method
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_usuario
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back_or_to(root_path)
  end
end
