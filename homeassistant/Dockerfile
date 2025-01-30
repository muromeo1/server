FROM homeassistant/home-assistant:latest

# RUN apk add --no-cache tar && \
#     apk add --no-cache openssl

# COPY core.tar.enc /tmp/core.tar.enc

# ARG SECRET

# RUN openssl enc -d -aes-256-cbc -pbkdf2 -in /tmp/core.tar.enc -out /tmp/core.tar -pass pass:${SECRET} && \
#     mkdir -p /tmp/homeassistant && \
#     tar -xvf /tmp/core.tar -C /tmp && \
#     tar -xvf /tmp/homeassistant.tar.gz -C /tmp/homeassistant && \
#     cp -a /tmp/homeassistant/data/. /config && \
#     cp /tmp/backup.json /config

# RUN rm -rf /tmp/core.tar /tmp/homeassistant.tar.gz /tmp/homeassistant

EXPOSE 8123

CMD ["python3", "-m", "homeassistant", "--config", "/config"]
