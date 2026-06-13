# Local Inference — Ollama

## Status: Active

## Endpoint

```
http://localhost:11434
```

Ollama runs as a background service on Windows startup.
No authentication required for local calls.

---

## Hardware Reference

The table below shows example hardware that supports the recommended model tier.
Adapt to your own GPU and VRAM capacity.

| Component | Example Spec | Notes |
|---|---|---|
| GPU | NVIDIA GTX 1060 or equivalent | CUDA required for GPU acceleration |
| VRAM | 4GB | Sets the ceiling for model size |
| RAM | 16GB | Sufficient for local inference workloads |
| CUDA | Active | Required for GPU-accelerated inference |
| Observed speed | ~30–40 tokens/sec (3B models) | Varies by GPU generation |

---

## Installed Models

| Model | Size | Best For |
|---|---|---|
| llama3.2:3b | 2.0GB | Routing, summarization, classification, simple Q&A |

---

## Configuration

| Variable | Recommended Value | Purpose |
|---|---|---|
| `OLLAMA_MODELS` | `<YOUR_MODEL_DRIVE>\Ollama\models` | Redirect model storage to a secondary drive |
| `OLLAMA_HOST` | `127.0.0.1:11434` (default) | API bind address |
| `OLLAMA_MAX_LOADED_MODELS` | `1` | Limit to one model in VRAM at a time (4GB constraint) |

Set `OLLAMA_MODELS` as a user-level environment variable so Ollama picks it up at service start:

```powershell
[System.Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\Ollama\models", "User")
```

Replace `D:\Ollama\models` with your preferred model storage path.

---

## API Reference

### Generate (single response)

```python
import requests

response = requests.post("http://localhost:11434/api/generate", json={
    "model": "llama3.2:3b",
    "prompt": "Your prompt here",
    "stream": False
})
print(response.json()["response"])
```

### Chat (conversational)

```python
import requests

response = requests.post("http://localhost:11434/api/chat", json={
    "model": "llama3.2:3b",
    "messages": [
        {"role": "user", "content": "Your message here"}
    ],
    "stream": False
})
print(response.json()["message"]["content"])
```

### List models

```python
import requests
models = requests.get("http://localhost:11434/api/tags").json()
```

### Health check

```python
import requests
healthy = requests.get("http://localhost:11434/").status_code == 200
```

---

## VRAM Limits — Model Guide

| Model | VRAM | Status |
|---|---|---|
| llama3.2:3b | ~2GB | Recommended for 4GB VRAM setups |
| phi3.5:mini | ~2.3GB | Good alternative, excellent quality/size ratio |
| llama3.1:8b (Q4) | ~5GB | Exceeds 4GB VRAM — CPU offload, slow |
| Any 70B+ | N/A | Not feasible on consumer GPUs |

Only load one model at a time when VRAM is limited.

---

## Operational Notes

- Ollama starts automatically with Windows if registered as a startup service
- First request after idle loads model into VRAM (~2–3 sec delay)
- Subsequent requests run at full GPU speed
- Restart command if unresponsive:

```powershell
Stop-Process -Name "ollama" -ErrorAction SilentlyContinue
Start-Process "$env:LOCALAPPDATA\Programs\Ollama\ollama.exe"
```
