AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY'],
  :secret_access_key => ENV['S3_SECRET']
  
  :smtp_address:                => ENV['SMTP_ADDRESS'],# smtp.gmail.com 
  :smtp_port:                   => ENV['SMTP_PORT'], # 587
  :smtp_user_name:              => ENV['SMTP_USER_NAME'], # example@gmail.com
  :smtp_password:               => ENV['SMTP_PASSWORD'], # password
  :smtp_authentication:         => ENV['SMTP_AUTHENTICATION'], # plain
  :smtp_enable_starttls_auto:   => ENV['SMTP_ENABLE_STARTTLS_AUTO'], # true
  :smtp_domain:                 => ENV['SMTP_DOMAIN'], # example.com # omit if using a normal Gmail account
  
)