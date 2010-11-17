class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter, :staff_required, :except => [:not_staff] 
  protect_from_forgery
  
  protected
  def staff_required
    unless session[:cas_extra_attributes] && session[:cas_extra_attributes]['emplid'].present?
      redirect_to '/dashboard/not_staff' and return false
    end
  end
end
