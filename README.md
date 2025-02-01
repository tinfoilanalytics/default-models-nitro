# default-models-nitro

This repository serves as both:

- Tinfoil's default inference enclave running CPU-only models using Ollama inference server, on AWS Nitro Enclaves
- A template for running your choice of CPU-only models on Nitro Enclaves

## Default Configuration

The default enclave runs the following models:

- `llama3.2:1b`
- `llama-guard3:1b`
- `qwen2.5-coder:0.5b`
- `nomic-embed-text`

And exposes the following endpoints for inference:

- `/api/chat`
- `/v1/chat/completions`
- `/api/generate`
- `/api/embed`
- `/v1/embeddings`

As shown in `config.json`.

## Custom Configuration

If you want to run a different set of models and/or expose a different set of endpoints:

1. Click "Use this template" to create a new repository
2. Edit `config.json` to customize:
    - `models`: Any model from Ollama's [library](https://ollama.com/library)
    - `paths`: API endpoints from Ollama's [API documentation](https://github.com/ollama/ollama/blob/main/docs/api.md) you want to expose
3. Create a release tag (e.g. `v0.0.1`) to trigger the build workflow
