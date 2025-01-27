FROM ghcr.io/tinfoilanalytics/nitro-attestation-shim:v0.2.2 AS shim

FROM ollama/ollama

RUN apt update -y
RUN apt install -y iproute2 jq

COPY --from=shim /nitro-attestation-shim /nitro-attestation-shim
COPY config.json /app/config.json
COPY start.sh /app/start.sh

ENV HOME=/

RUN chmod +x /app/start.sh && \
    nohup bash -c "ollama serve &" && sleep 5 && \
    for model in $(jq -r '.models[]' /app/config.json); do \
    ollama pull "$model"; \
    done

ENTRYPOINT ["/app/start.sh"]