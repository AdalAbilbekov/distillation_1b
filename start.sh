export WANDB_API_KEY=d6f39cbe461c04b7594d30e17320008239f80544
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7

# torchrun --nproc-per-node=4 finetuning.py --model_name meta-llama/Llama-3.2-1B-Instruct --dataset.file datasets/loader/squad.py --lr 1e-6 --num_epochs 1 --batch_size_training 1 --val_batch_size 1 --output_dir checkpoints/distilled_model --distillation_config.model_name checkpoints/stable_base_19200_llama --distillation --distillation_config.enable_fsdp --distillation_config.pure_bf16 --distillation_config.distil_factor 1.5 --save_step 1 --context_length 8192

accelerate launch finetuning.py --model_name meta-llama/Llama-3.2-1B-Instruct --dataset.file datasets/loader/squad.py --lr 1e-6 --num_epochs 5 --batch_size_training 1 --val_batch_size 1 --output_dir checkpoints/distilled_model --distillation_config.model_name checkpoints/stable_base_19200_llama --distillation --distillation_config.enable_fsdp --distillation_config.pure_bf16 --distillation_config.distil_factor 1.5 --save_step 500 --context_length 8192


# accelerate launch finetuning.py --model_name checkpoints/llama_issai_batok_cr4_37800 --dataset.file datasets/loader/squad.py --lr 1e-6 --num_epochs 1 --batch_size_training 1 --val_batch_size 1 --output_dir checkpoints/distilled_model --distillation_config.model_name checkpoints/stable_base_19200_llama --distillation --distillation_config.enable_fsdp --distillation_config.pure_bf16 --distillation_config.distil_factor 1.5 --save_step 300 --context_length 8192 --fsdp_config.fsdp_cpu_offload True
# CUDA_VISIBLE_DEVICES=7 python finetuning.py --model_name checkpoints/Meta-Llama-3.1-8B-Instruct --dataset.file datasets/loader/squad.py --lr 1e-6 --num_epochs 5 --batch_size_training 1 --val_batch_size 1 --output_dir train/output/path --distillation_config.model_name checkpoints/stable_base_19200_llama --distillation --distillation_config.enable_fsdp False --distillation_config.pure_bf16 --distillation_config.distil_factor 1.5 --save_step 100 --context_length 200
# CUDA_VISIBLE_DEVICES=7 python finetuning.py --model_name checkpoints/llama_issai_batok_cr4_37800 --dataset.file datasets/loader/squad.py --lr 1e-6 --num_epochs 5 --batch_size_training 1 --val_batch_size 1 --output_dir train/output/path --distillation_config.model_name checkpoints/stable_base_19200_llama --distillation --distillation_config.enable_fsdp False --distillation_config.distil_factor 0.5 --save_step 100 --context_length 8192
# CUDA_VISIBLE_DEVICES=7 python finetuning.py --model_name meta-llama/Llama-3.2-1B-Instruct --dataset.file datasets/loader/squad.py --lr 1e-6 --num_epochs 5 --batch_size_training 1 --val_batch_size 1 --output_dir checkpoints/distilled_model --distillation_config.model_name checkpoints/stable_base_19200_llama --distillation --distillation_config.enable_fsdp False --distillation_config.pure_bf16 --distillation_config.distil_factor 1.5 --save_step 1 --context_length 8192
