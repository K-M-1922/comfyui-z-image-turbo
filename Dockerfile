# Z Image Turbo — ComfyUI RunPod Template
FROM runpod/worker-comfyui:5.8.5-base-cuda12.8.1

# Download Z Image Turbo diffusion model
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors \
    --relative-path diffusion_models

# Download Qwen 3 4B text encoder
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors \
    --relative-path text_encoders

# Download VAE
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors \
    --relative-path vae

# Start ComfyUI / RunPod worker
CMD ["/start.sh"]
