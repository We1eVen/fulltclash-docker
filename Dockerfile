FROM alpine as git
WORKDIR /app
RUN apk add --no-cache git && \
         git clone -b master --single-branch  --depth=1 https://github.com/AirportR/FullTclash.git .

FROM ubuntu
LABEL Auther="AirportR" \
      Source="https://github.com/AirportR/FullTclash" \
      Builder="We1eVen"
WORKDIR /app
COPY --from=git /app .
COPY config.yaml resources/
COPY main.sh .
ENV TZ=Asia/Shanghai
ENV CORE=1
ENV THREAD=4
ENV PROXY=0
RUN apt update && apt install -y --no-install-recommends python3 python3-pip git && \
         ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt install tzdata && \
         apt autoclean && rm -rf /var/lib/apt/lists/* && \
         pip install -r requirements.txt && pip install cryptography && \
         chmod -R +x .
ENTRYPOINT ["./main.sh"]
