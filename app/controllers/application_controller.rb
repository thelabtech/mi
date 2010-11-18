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
    unless session[:cas_extra_attributes] && session[:cas_extra_attributes]['emplid'].present?
      # redirect_to '/dashboard/not_staff' and return false
    end
  end
end
