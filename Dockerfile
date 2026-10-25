FROM sigoden/dufs:latest

RUN mkdir -p /data/public

EXPOSE 5000

ENTRYPOINT ["/bin/dufs"]

CMD ["/data", "-A", "--assets", "/assets", "-b", "0.0.0.0", "-p", "5000"]
