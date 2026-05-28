FROM runpod/worker-comfyui:5.8.5-base-cuda12.8.1

USER root

RUN apt-get update && apt-get install -y \
    aria2 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p \
    /ComfyUI/models/diffusion_models \
    /ComfyUI/models/text_encoders \
    /ComfyUI/models/vae

RUN aria2c -x 16 -s 16 -k 1M --continue=true --max-tries=5 --retry-wait=10 \
    -d /ComfyUI/models/diffusion_models \
    -o z_image_turbo_bf16.safetensors \
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors"

RUN aria2c -x 16 -s 16 -k 1M --continue=true --max-tries=5 --retry-wait=10 \
    -d /ComfyUI/models/text_encoders \
    -o qwen_3_4b.safetensors \
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors"

RUN aria2c -x 16 -s 16 -k 1M --continue=true --max-tries=5 --retry-wait=10 \
    -d /ComfyUI/models/vae \
    -o ae.safetensors \
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors"

CMD ["/start.sh"]
