class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  protect_from_forgery
  
  protected
  def login_required
    return CASClient::Frameworks::Rails::Filter
  end
end
