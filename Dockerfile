FROM ubuntu
LABEL Source="https://github.com/AirportR/FullTclash" \
      Builder="We1eVen"
WORKDIR /app
ENV TZ=Asia/Shanghai
ENV CORE=1
ENV THREAD=4
ENV PROXY=0
RUN apt update && apt install -y --no-install-recommends python3 python3-pip git && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt install tzdata && \
    apt clean && rm -rf /var/lib/apt/lists/*
RUN git clone -b master --single-branch  --depth=1 https://github.com/AirportR/FullTclash.git . && \
    pip install -r requirements.txt
COPY config.yaml resources/
COPY main.sh .
RUN  chmod -R +x .
ENTRYPOINT ["./main.sh"]
