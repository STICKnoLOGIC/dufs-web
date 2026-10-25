FROM sigoden/dufs:latest AS dufs-source

FROM alpine:latest

COPY --from=dufs-source /bin/dufs /bin/dufs

RUN mkdir -p /assets /data/public

COPY public.md /data/public/readme.md

COPY README.md /data/readme.md

WORKDIR /assets

RUN wget -q \
      "https://github.com/sigoden/dufs/raw/refs/heads/main/assets/favicon.ico" \
      "https://raw.githubusercontent.com/sigoden/dufs/refs/heads/main/assets/index.css" \
      "https://raw.githubusercontent.com/sigoden/dufs/refs/heads/main/assets/index.js" \
      "https://raw.githubusercontent.com/sigoden/dufs/refs/heads/main/assets/index.html"


EXPOSE 5000

ENTRYPOINT ["/bin/dufs"]

CMD ["/data", "-A", "--assets", "/assets", "-b", "0.0.0.0", "-p", "5000"]
