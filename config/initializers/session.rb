AWS::S3::Base.establish_connection!(
  :session_key     => ENV['SESSION_KEY'],
  :session_secret => ENV['SESSION_SECRET']
)