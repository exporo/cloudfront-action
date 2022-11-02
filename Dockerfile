FROM python:3.8

LABEL "com.github.actions.name"="cloudfront"
LABEL "com.github.actions.description"="Github action to create invalidation of Cloudfront."


LABEL repository="https://github.com/exporo/cloudfront-action"


# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.18.14'


RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
