class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter, :staff_required, :except => [:not_staff] 
  before_filter :iphone_check
  protect_from_forgery
  
  protected
  def iphone_check
    if session[:iphone].nil? && request.env["HTTP_USER_AGENT"]
      session[:iphone] = request.env["HTTP_USER_AGENT"][/(iPhone|iPod)/]
    end
  end
  def staff_required
    unless current_user && current_user.person && current_user.person.isStaff?
      redirect_to '/dashboard/not_staff' and return false
    end
  end
  
  def current_user
    unless @current_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      else
        if session[:cas_extra_attributes].present? && guid = session[:cas_extra_attributes]['ssoGuid']
          @current_user = User.find_by_globallyUniqueID(guid)
        end
        @current_user ||= User.find_by_username(session[:cas_user])
        session[:user_id] = @current_user.id
      end
    end
    @current_user
  end
end
