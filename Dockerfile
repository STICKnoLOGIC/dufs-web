FROM sigoden/dufs:latest AS dufs-source

FROM alpine:latest

COPY --from=dufs-source /bin/dufs /bin/dufs

RUN mkdir -p /data/punlic

EXPOSE 5000

ENTRYPOINT ["/bin/dufs"]

CMD ["/data", "-A", "-b", "0.0.0.0", "-p", "5000"]
