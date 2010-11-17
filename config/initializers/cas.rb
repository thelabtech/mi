require 'casclient'
require 'casclient/frameworks/rails/filter'
CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://signin.ccci.org/cas",
  :extra_attributes_session_key => :cas_extra_attributes
)