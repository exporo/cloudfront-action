# cloudfront-action

Github action to create invalidation of Cloudfront.  
See [action.yml](./action.yml) for Comprehensive List of Options.  

## Usage

### `workflow.yml` Example

Refer to [`aws cloudfront create-invalidation` Docs](https://docs.aws.amazon.com/cli/latest/reference/cloudfront/create-invalidation.html) for more details.

```yaml
name: Invalidate Cloudfront Distribution
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: exporo/cloudfront-action@main
      env:
        SOURCE_PATH: './public'
        AWS_REGION: 'us-east-1'
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_SESSION_TOKEN: ${{ secrets.AWS_SESSION_TOKEN }}
        DISTRIBUTION_ID: ${{ secrets.DISTRIBUTION_ID }}
```
```yaml
name: Invalidate Cloudfront Distribution
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master

    - name: Configure aws credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        role-to-assume: arn:aws:iam::123456789100:role/my-github-actions-role
        aws-region: us-east-1

    - uses: exporo/cloudfront-action@main
      env:
        SOURCE_PATH: './public'
        AWS_REGION: 'us-east-1'
        DISTRIBUTION_ID: ${{ secrets.DISTRIBUTION_ID }}
```