#!/bin/bash

# Read configuration
CONFIG_FILE="/app/config.json"
PATHS=$(jq -r '.paths[]' $CONFIG_FILE)

# Build shim arguments
SHIM_ARGS=(
    "-e" "tls@tinfoil.sh"
    "-u" "11434"
)

# Add paths from config
for path in $PATHS; do
    SHIM_ARGS+=("-p" "$path")
done

# Add final arguments
SHIM_ARGS+=("--" "/bin/ollama" "serve")

# Execute shim with arguments
exec /nitro-attestation-shim "${SHIM_ARGS[@]}"