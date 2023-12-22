CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = 'news-site-announcements' # for AWS-side bucket access permissions config, see section below
    config.aws_acl    = 'private'
  
    # Optionally define an asset host for configurations that are fronted by a
    # content host, such as CloudFront.
    config.asset_host = 'http://example.com'
    # config.asset_host = proc { |file| ... } # or can be a proc
  
    # The maximum period for authenticated_urls is only 7 days.
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  
    # Set custom options such as cache control to leverage browser caching.
    # You can use either a static Hash or a Proc.
    config.aws_attributes = -> { {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
    } }
  
    config.aws_credentials = {
      access_key_id:     Rails.application.credentials.aws.access_key_id,
      secret_access_key:  Rails.application.credentials.aws.secret_access_key,
      region:            'us-east-1',
      stub_responses:    Rails.env.test?
    }
  
    # Optional: Signing of download urls, e.g. for serving private content through
    # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
    # configured:
    # config.aws_signer = -> (unsigned_url, options) do
    #   Aws::CF::Signer.sign_url(unsigned_url, options)
    # end
  end
  