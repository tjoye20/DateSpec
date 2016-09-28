Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, 'd20abc65d5c0901814ce', 'd46c3dbdaa6ad85fb4091772f739d183ce1c604e'
end