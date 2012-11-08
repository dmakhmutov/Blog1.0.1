class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :catch_exceptions

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  def render_404
    render 'public#404', :status => 404
  end

  def expire_content_cache
    expire_fragment %r{.*}
  end

  def catch_exceptions
    yield
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
