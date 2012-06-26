Airbrake.configure do |config|
  config.api_key		= '1944c090ddf5154694854fc35b676edc'
  config.host				= 'errors.uscm.org'
  config.port				= 80
  config.secure			= config.port == 443
end

