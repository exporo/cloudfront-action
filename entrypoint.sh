#!/bin/sh

set -e

if [ -z "$DISTRIBUTION_ID" ]; then
  echo "DISTRIBUTION_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "AWS_ACCESS_KEY_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_SECRET_ACCESS_KEY is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_SESSION_TOKEN" ]; then
  echo "AWS_SESSION_TOKEN is not set. Quitting."
  exit 1
fi

# Default to us-east-1 if AWS_REGION not set.
if [ -z "$AWS_REGION" ]; then
  AWS_REGION="us-east-1"
fi

SOURCE_PATH=${SOURCE_PATH:-/*}

sh -c "aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths '${SOURCE_PATH}' "