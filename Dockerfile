FROM alpine:3.4

# Install kubectl
# Note: Latest version may be found on:

ENV HOME=/config
ENV VERSION=v1.6.2


# for new versioncurl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt
ADD https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client


#Add the config for the kubectl
COPY ./config /config/.kube/config

RUN chown -R kubectl ./config

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

USER kubectl

VOLUME /config

CMD ["/docker-entrypoint.sh"]