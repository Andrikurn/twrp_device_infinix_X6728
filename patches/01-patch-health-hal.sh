#!/bin/bash

BP_FILE="hardware/interfaces/health/aidl/default/Android.bp"

# Verify the file exists before attempting to patch it
if [ ! -f "$BP_FILE" ]; then
    echo "[-] Error: Cannot find $BP_FILE. Ensure your path is correct."
    exit 1
fi

echo "[*] Creating backup of the original Android.bp..."
cp "$BP_FILE" "${BP_FILE}.bak"

echo "[*] Patching Android.bp to remove shared vintf_fragments..."
sed -i '/vintf_fragments: \["android.hardware.health-service.example.xml"\],/d' "$BP_FILE"

echo "[+] Android.bp successfully patched."