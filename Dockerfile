FROM alpine:3.10

LABEL maintainer="Gytis Tamulynas <GytisT1@gmail.com>" \
    description="Alpine with helm and curl. Made for packaging and uploading charts to chartmuseum" \
    version="v2.0.0"

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v3.0.2-linux-amd64.tar.gz"

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

WORKDIR /apps

ENTRYPOINT ["helm"]
CMD ["--help"]
