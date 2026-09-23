FROM ubuntu:22.04

# Installiamo SSH, Sudo e Python3 (necessario per Ansible)
RUN apt-get update && apt-get install -y openssh-server sudo python3 && \
    mkdir /var/run/sshd

# Creiamo l'utente 'ubuntu' e gli diamo i permessi di sudo senza password
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Copiamo la chiave SSH pubblica nella cartella dell'utente
RUN mkdir -p /home/ubuntu/.ssh
COPY iac_lab_key.pub /home/ubuntu/.ssh/authorized_keys

# Impostiamo i permessi di sicurezza corretti per SSH
RUN chown -R ubuntu:root /home/ubuntu/.ssh && \
    chmod 700 /home/ubuntu/.ssh && \
    chmod 600 /home/ubuntu/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
