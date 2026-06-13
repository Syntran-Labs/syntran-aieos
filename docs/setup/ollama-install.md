# Ollama Installation — Secondary Drive Setup

**Type:** How-to
**Audience:** SYNTRAN framework user setting up local inference
**Platform:** Windows 10/11

---

## Why a Secondary Drive for Models

The Ollama executable is ~200MB — its location has little impact on performance.
The models are 2–8GB each — loading them from SSD is the real performance win.

Ollama supports the `OLLAMA_MODELS` environment variable to redirect model storage.
Point this at a path on your secondary drive before pulling any model.

---

## Step 1 — Download and Run the Installer

Download the Ollama installer from [ollama.com](https://ollama.com) and run it.

```powershell
# If you have the installer on a secondary drive:
Start-Process "<drive>:\OllamaSetup.exe" -Wait
```

Or simply double-click the installer in Explorer.

Ollama installs to:
```
%LOCALAPPDATA%\Programs\Ollama\
```

It registers as a background service and adds itself to startup.

---

## Step 2 — Create the Model Storage Directory

Choose a directory on your secondary drive for model storage:

```powershell
New-Item -ItemType Directory -Force -Path "<drive>:\Ollama\models"
```

Replace `<drive>` with your actual secondary drive letter (e.g., `D`, `E`).

---

## Step 3 — Set OLLAMA_MODELS Environment Variable

Set this as a user-level environment variable so it persists across restarts:

```powershell
# Set permanently for current user
[System.Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "<drive>:\Ollama\models", "User")
```

Verify:

```powershell
[System.Environment]::GetEnvironmentVariable("OLLAMA_MODELS", "User")
# Expected: <drive>:\Ollama\models
```

---

## Step 4 — Restart the Ollama Service

The environment variable is read at service start. Restart it so the change takes effect:

```powershell
Stop-Process -Name "ollama" -ErrorAction SilentlyContinue
Start-Process "$env:LOCALAPPDATA\Programs\Ollama\ollama.exe"
```

Or restart the machine (cleanest option).

---

## Step 5 — Verify GPU Detection

```powershell
ollama info
```

Expected output should include your GPU name and VRAM. If no GPU is listed, Ollama falls back to CPU (slow). Ensure NVIDIA or AMD drivers are up to date.

---

## Step 6 — Pull the Recommended Model

For 4GB VRAM systems:

```powershell
# Option A — Llama 3.2 3B (fast, ~2GB, good for routing and simple tasks)
ollama pull llama3.2:3b

# Option B — Phi-3.5 Mini (3.8B, ~2.3GB, excellent quality/size ratio)
ollama pull phi3.5:mini
```

Models download to your configured `OLLAMA_MODELS` path.

Verify:
```powershell
ollama list
```

---

## Step 7 — Test

```powershell
ollama run llama3.2:3b "In one sentence: what is machine learning?"
```

Or use the included smoke test script:

```powershell
python scripts\test_ollama.py
```

---

## Step 8 — Verify Models Are on the Secondary Drive

```powershell
Get-ChildItem "<drive>:\Ollama\models" -Recurse | Measure-Object -Property Length -Sum
```

Should show the model file sizes — confirms the secondary drive is being used.

---

## Model Selection by VRAM

| Model | VRAM | Speed | Best For |
|---|---|---|---|
| llama3.2:3b | ~2GB | Fast | Routing, summarization, simple tasks |
| phi3.5:mini | ~2.3GB | Fast | Reasoning, code, Q&A |
| llama3.1:8b-q4 | ~5GB | Slow (CPU offload on 4GB) | Higher quality, slower |

Start with `llama3.2:3b`. Add `phi3.5:mini` as a secondary option.
Do not attempt 8B+ on 4GB VRAM without accepting CPU offload (significantly slower).

---

## Environment Variable Reference

| Variable | Purpose | Example Value |
|---|---|---|
| `OLLAMA_MODELS` | Where models are stored | `D:\Ollama\models` |
| `OLLAMA_HOST` | API bind address | `127.0.0.1:11434` (default) |
| `OLLAMA_NUM_GPU` | GPU layers to use | Leave unset (auto-detect) |
| `OLLAMA_MAX_LOADED_MODELS` | Max models in memory | `1` (for 4GB VRAM) |

---

## API Access

Once running, Ollama exposes a REST API at:

```
http://localhost:11434
```

Test:
```powershell
Invoke-RestMethod -Uri "http://localhost:11434/api/tags"
```

---

## Troubleshooting

**Ollama not using GPU:**
- Run `nvidia-smi` or `rocm-smi` — verify driver is active
- Check `ollama info` for GPU detection
- Reinstall GPU driver if missing

**Models not going to secondary drive:**
- Confirm env var: `$env:OLLAMA_MODELS`
- Restart the Ollama process after setting the variable

**Out of VRAM:**
- Stick to models under 3B parameters for fast GPU inference
- Or accept CPU offload for larger models (slow but functional)
