if Rails.env == "prod"
  Rails.application.config.session_store :cookie_store, key: "_wle_api", domain: "blahblahblah.com" 
else
  Rails.application.config.session_store :cookie_store, key: "_wle_api"
end