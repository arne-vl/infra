# Ubuntu VM - N8N setup

1. Set up a minimal Ubuntu VM in Azure with username & password.

2. Copy the files to the VM using `scp`:
```bash
scp -r ./* username@ip_address:/home/username/setup
```

3. SSH into the VM:
```bash
ssh username@ip_address
```

4. Navigate to the setup directory:
```bash
cd setup
```

5. Make the setup scripts executable:
```bash
chmod +x *.sh
```

6. Install dependencies using the following script, script will reboot the VM if done:
```bash
./ubuntu-gui-setup.sh
```

7. Log back into SSH and set up n8n using the provided script:
```bash
./n8n-setup.sh
```

8. Network rules in Azure:
    - Create an Allow rule for port 3389 TCP is enabled for Remote Desktop access.
```bash
az vm open-port --resource-group <resource-group-name> --name <vm-name> --port 3389
```
    - Create an Allow rule for port 5678 TCP to access n8n.
```bash
az vm open-port --resource-group <resource-group-name> --name <vm-name> --port 5678
```
    - You can delete the SSH rule if you want to restrict access to Remote Desktop only.

9. After this you can use Remote Desktop to connect to the VM and access n8n at `http://localhost:5678`.

