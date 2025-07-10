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
6. Install a graphical interface and xrdp for remote desktop using the following script:
```bash
./ubuntu-gui-setup.sh
```
7. Install Docker and run n8n using the provided script:
```bash
./n8n-setup.sh
```
8. Restart the VM in the Azure portal to ensure all changes take effect.
9. After this you can use Remote Desktop to connect to the VM and access n8n at `http://localhost:5678`.
