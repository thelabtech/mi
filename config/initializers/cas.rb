require 'casclient'
require 'casclient/frameworks/rails/filter'

# enable detailed CAS logging
CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://signin.relaysso.org/cas",
  :login_url => "https://signin.relaysso.org/cas/login",
  :validate_url => "https://signin.relaysso.org/cas/serviceValidate"
)
