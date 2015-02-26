class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :register_visit, only: ['show']

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

  def register_visit
     type_url = params[:controller].split("/").first
     page_type = History::TYPES_URLS[type_url]
     if params.has_key?(:id) && page_type != nil && page_type > 0
         history = History.new
         history.page_type = page_type
         history.entity_id = params[:id]
         history.page_url = request.original_url
         history.donor_url = request.referer
         history.save
     end
  end

  protected

  def current_layout
      @current_layout = params[:controller].split("/").first
  end
end
