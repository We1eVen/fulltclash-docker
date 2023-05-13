FROM alpine as git
WORKDIR /app
RUN apk add --no-cache git wget && \
         git clone -b master --single-branch  --depth=1 https://github.com/AirportR/FullTclash.git . && \
         wget https://raw.githubusercontent.com/We1eVen/fulltclash-docker/master/config.yaml -O resources/config.yaml

FROM alpine
LABEL Auther="AirportR" \
      Source="https://github.com/AirportR/FullTclash" \
      Builder="We1eVen"
WORKDIR /app
COPY --from=git /app .
RUN apk add --no-cache python3 py3-pip && \
         cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
         echo Asia/Shanghai > /etc/timezone && \
         pip install -r requirements.txt
ENTRYPOINT ["sh", "-c", "python3 main.py"]
