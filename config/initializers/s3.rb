AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY'],
  :secret_access_key => ENV['S3_SECRET'],
  :s3_bucket_name     => ENV['S3_BUCKET_NAME']
)