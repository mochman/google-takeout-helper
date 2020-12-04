FROM python:3.9-alpine
LABEL maintainer="Luke Moch" \
			name="google-takeout-helper" \
			version="1.0.0" \
			gpth-version="1.2.0"

COPY docker-entrypoint.sh /

RUN pip install -U google-photos-takeout-helper

VOLUME ["/photosIn", "/photosOut"]

RUN chmod 777 /photosIn /photosOut

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
