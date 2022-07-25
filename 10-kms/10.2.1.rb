require 'aws-sdk-s3'

bucket = 'willdeberry-bucket'
key = '10.2.1-secret.txt'
region = 'us-east-1'
kms_key_alias = 'alias/willDeBerryAlias'
content = File.read(key)

s3_client = Aws::S3::EncryptionV2::Client.new(
    region: region,
    kms_key_id: kms_key_alias,
    key_wrap_schema: :kms_context,
    content_encryption_schema: :aes_gcm_no_padding,
    security_profile: :v2
)

s3_client.put_object(
    bucket: bucket,
    key: key,
    body: content
)

response = s3_client.get_object(
    bucket: bucket,
    key: key
)

puts response.body.read
