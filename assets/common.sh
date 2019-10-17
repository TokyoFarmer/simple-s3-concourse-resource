
parse_source_config() {
  payload=$(mktemp /tmp/resource-in.XXXXXX)
  cat > $payload <&0
  BUCKET=$(jq -r '.source.bucket // "something"' $payload)
  BUCKET_DIR=$(jq -r '.source.bucket_subfolder // ""' $payload)
  FILTER=$(jq -r '.source.filter // ""' $payload)
  export AWS_ACCESS_KEY_ID=$(jq -r '.source.aws_access_key_id // ""' $payload)
  export AWS_SECRET_ACCESS_KEY=$(jq -r '.source.aws_secret_access_key// ""' $payload)
  export AWS_DEFAULT_REGION=$(jq -r '.source.aws_default_region // "us-east-1"' $payload)
  VERSION=$(jq -r '.version.ref // ""' $payload)
}
