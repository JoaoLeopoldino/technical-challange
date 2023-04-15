Aws.config.update({
    region: Figaro.env.s3_region,
    credentials: Aws::Credentials.new(Figaro.env.s3_access_key, Figaro.env.s3_secret_key),
  })