# ─────────────────────────────────────────────
# Z Image Turbo — ComfyUI RunPod Template
# Base: runpod/worker-comfyui (official)
#
# Check latest version tag at:
# https://github.com/runpod-workers/worker-comfyui/releases
# Replace 5.8.5 below with the latest -base tag you find there.
# ─────────────────────────────────────────────
FROM runpod/worker-comfyui:5.8.5-base

# ─────────────────────────────────────────────
# Download Z Image Turbo diffusion model
# Size: 12.3 GB
# Destination: ComfyUI/models/diffusion_models/
# ─────────────────────────────────────────────
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors \
    --relative-path diffusion_models

# ─────────────────────────────────────────────
# Download Qwen 3 4B text encoder
# Size: 8.04 GB
# Destination: ComfyUI/models/text_encoders/
# ─────────────────────────────────────────────
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors \
    --relative-path text_encoders

# ─────────────────────────────────────────────
# Download VAE
# Size: 335 MB
# Destination: ComfyUI/models/vae/
# ─────────────────────────────────────────────
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors \
    --relative-path vae

# ─────────────────────────────────────────────
# Start ComfyUI
# ─────────────────────────────────────────────
CMD ["/start.sh"]
