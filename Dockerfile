FROM alpine:3.9

# install AWS CLI
ENV AWS_CLI_VERSION 1.16.81
RUN apk --update --no-cache add \
    python \
    py-pip \
    groff \
    less \
    mailcap \
    && \
    pip install --upgrade awscli==${AWS_CLI_VERSION} && \
    apk -v --purge del py-pip

# install kubectl
ENV KUBECTL_VERSION 1.12.7
RUN wget -q -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

# install Kustomize
ENV KUSTOMIZE_VERSION 2.0.3
RUN wget -q -O /usr/local/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64 && \
    chmod +x /usr/local/bin/kustomize

# install AWS IAM Authenticator
ENV AWS_IAM_AUTHENTICATOR_RELEASE_DATE 2019-03-27
ENV AWS_IAM_AUTHENTICATOR_VERSION 1.12.7
RUN wget -q -O /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/${AWS_IAM_AUTHENTICATOR_VERSION}/${AWS_IAM_AUTHENTICATOR_RELEASE_DATE}/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator