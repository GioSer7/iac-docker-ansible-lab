# Infrastructure as Code (IaC) - Docker, Terraform & Ansible

Progetto di laboratorio per l'automazione del provisioning infrastrutturale e della configurazione software.

## Architettura
- **Host OS:** Linux Mint
- **Container Runtime:** Docker CE
- **Provisioning:** Terraform (Provider `kreuzwerker/docker`)
- **Configuration Management:** Ansible
- **Web Server:** Nginx (Container Ubuntu 22.04)

## Mappatura Porte
- SSH: `2222` -> `22`
- HTTP: `8080` -> `80`

## Struttura del Progetto
.
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   └── Dockerfile
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini
│   ├── playbook.yml
│   └── files/
│       └── index.html
└── README.md


## Come Replicare l'Ambiente

1. **Generazione Chiave SSH:**
   ```bash
   ssh-keygen -t ed25519 -f ~/.ssh/iac_lab_key -N ""
   cp ~/.ssh/iac_lab_key.pub ~/iac-lab/terraform/
Provisioning Infrastruttura:

Bash
cd terraform
terraform init
terraform apply -auto-approve
docker exec iac-target-server service ssh start
Deploy Software con Ansible:

Bash
cd ../ansible
ansible-playbook playbook.yml
Accesso al Servizio:
Apri il browser all'indirizzo http://localhost:8080.
