class DashboardController < AdminController
  protect_from_forgery with: :exception
  layout "admin"

  def index

  end
end
