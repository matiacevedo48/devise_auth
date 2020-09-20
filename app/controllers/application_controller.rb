class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

def authenticate_admin!
  unless current_user.present? && current_user.is_admin?
    redirect_to root_path, notice: "Access Denied, User don't have access rights..."
  end
end
