class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin"
  http_basic_authenticate_with :name => ADMIN_USER, :password => ADMIN_PASSWORD

end
