Deploying small envirment to run Lineage 2 Server with load balancer
L2ProjectX/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vms/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── load_balancer/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── provider.tf
