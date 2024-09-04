INPUT_SCHEMA = {
    'zip_url': {
        'type': str,
        'required': True
    },
    'instance_name': {
        'type': str,
        'required': True
    },
    'class_name': {
        'type': str,
        'required': True
    },
    'unet_lr': {
        'type': float,
        'required': False,
        'default': 0.0001
    },
    'network_dim': {
        'type': int,
        'required': False,
        'default': 256
    },
    'lr_scheduler_num_cycles': {
        'type': int,
        'required': False,
        'default': 1
    },
    'learning_rate': {
        'type': float,
        'required': False,
        'default': 0.0004  # Updated default to 0.0004
    },
    'lr_scheduler': {
        'type': str,
        'required': False,
        'default': 'cosine'
    },
    'lr_warmup_steps': {
        'type': int,
        'required': False,
        'default': 280
    },
    'train_batch_size': {
        'type': int,
        'required': False,
        'default': 1  # Confirmed train batch size as 1
    },
    'max_train_steps': {
        'type': int,
        'required': False,
        'default': 1250
    },
    'mixed_precision': {
        'type': str,
        'required': False,
        'default': 'bf16'  # Updated default to 'bf16'
    },
    'save_precision': {
        'type': str,
        'required': False,
        'default': 'float16'  # Updated default to 'float16'
    },
    'optimizer_type': {
        'type': str,
        'required': False,
        'default': 'adamw8bit'  # Updated default to 'adamw8bit'
    },
    'max_data_loader_num_workers': {
        'type': int,
        'required': False,
        'default': 0
    },
    'steps': {
        'type': int,
        'required': False,
        'default': 1000  # Updated default to 1000
    }
}
