"""
Quick health check and smoke test for local Ollama inference.
Run this any time to verify the local model is working.

Usage:
    python scripts/test_ollama.py
"""

import sys
import time
import requests

OLLAMA_BASE = "http://localhost:11434"
MODEL = "llama3.2:3b"


def check_health() -> bool:
    try:
        r = requests.get(OLLAMA_BASE, timeout=3)
        return r.status_code == 200
    except requests.exceptions.ConnectionError:
        return False


def list_models() -> list[str]:
    r = requests.get(f"{OLLAMA_BASE}/api/tags", timeout=5)
    r.raise_for_status()
    return [m["name"] for m in r.json().get("models", [])]


def generate(prompt: str, model: str = MODEL) -> tuple[str, float]:
    start = time.time()
    r = requests.post(
        f"{OLLAMA_BASE}/api/generate",
        json={"model": model, "prompt": prompt, "stream": False},
        timeout=60,
    )
    r.raise_for_status()
    data = r.json()
    elapsed = time.time() - start
    tokens_per_sec = round(
        data.get("eval_count", 0) / (data.get("eval_duration", 1) / 1e9), 1
    )
    return data["response"], tokens_per_sec


def main():
    print("=== Ollama Health Check ===\n")

    # 1. Server reachable
    if not check_health():
        print("FAIL: Ollama server not reachable at", OLLAMA_BASE)
        print("Run: Start-Process \"$env:LOCALAPPDATA\\Programs\\Ollama\\ollama.exe\"")
        sys.exit(1)
    print("OK   Server reachable at", OLLAMA_BASE)

    # 2. Model available
    models = list_models()
    if MODEL not in models:
        print(f"FAIL: Model '{MODEL}' not found. Installed: {models}")
        print(f"Run: ollama pull {MODEL}")
        sys.exit(1)
    print(f"OK   Model '{MODEL}' installed")
    print(f"     All models: {', '.join(models)}")

    # 3. Inference test
    print(f"\nRunning inference test...")
    response, speed = generate("Reply with exactly three words: local inference works.")
    print(f"OK   Response: {response.strip()}")
    print(f"     Speed: {speed} tokens/sec")

    # 4. Summary
    print("\n=== Result ===")
    print("Local inference is operational.")
    print(f"Endpoint : {OLLAMA_BASE}")
    print(f"Model    : {MODEL}")
    print(f"Speed    : {speed} tok/sec")


if __name__ == "__main__":
    main()
