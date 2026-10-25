FROM sigoden/dufs:latest AS dufs-source

FROM alpine:latest

COPY --from=dufs-source /bin/dufs /bin/dufs

COPY --from=dufs-source /assets /assets

COPY public.md /data/public/readme.md

COPY readme.md /data/readme.md

RUN mkdir -p /data/public

EXPOSE 5000

ENTRYPOINT ["/bin/dufs"]

CMD ["/data", "-A", "--assets", "/assets", "-b", "0.0.0.0", "-p", "5000"]
