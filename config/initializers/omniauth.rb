Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1377092099016336', 'b28e76e290639a4d88d2f8f8491cbe91',{
    info_fields: 'first_name,last_name,email,cover'
  }
  provider :google_oauth2, '549229024273-ua9m01f05fen6ovavrlqt6hm07e29659.apps.googleusercontent.com','3a-TrCmHovAmj9lLCreW6yIC', {
    scope:'email,profile'
  }
end
