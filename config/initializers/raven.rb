Raven.configure do |config|

  # requires a cert file, set via an env var to talk to assembly...
  # SSL_CERT_FILE=./config/cacert.pem

  # filter sensitive params
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)

  # only log errors in production
  config.environments = ['production']

  # don't exclude any exception types for now, the default list is...
  # ["AbstractController::ActionNotFound", "ActionController::InvalidAuthenticityToken", "ActionController::RoutingError", "ActionController::UnknownAction", "ActiveRecord::RecordNotFound", "CGI::Session::CookieStore::TamperedWithCookie", "Mongoid::Errors::DocumentNotFound", "Sinatra::NotFound"]
  config.excluded_exceptions = []
end