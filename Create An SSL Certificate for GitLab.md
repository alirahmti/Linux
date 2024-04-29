# Create An SSL Certificate 🔐
🔸 You can create your own SSL certificate with the OpenSSL binary. A certificate request can then be sent to a certificate authority (CA) to get it signed into a certificate, or if you have your own certificate authority, you may sign it yourself, or you can use a self-signed certificate (because you just want a test certificate or because you are setting up your own CA).



📝 NOTE: The current Bitnami GitLab installation already includes the server.key and the server.crt certificates. It is strongly recommended to back up these files before create a new ones. Run the following commands to make sure that you save a copy of the current self-signed certificates:

```bash
sudo mv /etc/gitlab/ssl/server.crt /etc/gitlab/ssl/server.crt.back
sudo mv /etc/gitlab/ssl/server.key /etc/gitlab/ssl/server.key.back
```

## Generate a new private key:  🔒

```bash
sudo openssl genrsa -out /etc/gitlab/ssl/server.key 2048
```

## Create a certificate: 📑

```bash
sudo openssl req -new -key /etc/gitlab/ssl/server.key -out  /etc/gitlab/ssl/cert.csr
```
⚠️ IMPORTANT: Enter the server domain name when the above command asks for the “Common Name”. ⚠️

🔸 Send cert.csr to the certificate authority. When the certificate authority completes their checks (and probably received payment from you), they will hand over your new certificate to you.

🔸 Until the certificate is received, create a temporary self-signed certificate:

```bash
sudo openssl x509 -in  /etc/gitlab/ssl/cert.csr -out  /etc/gitlab/ssl/server.crt -req -signkey  /etc/gitlab/ssl/server.key -days 365
```
🔸 Back up your private key in a safe location after generating a password-protected version as follows:

🔻 Note that if you use this encrypted key in the configuration file, GitLab won’t be able to start Nginx after any gitlab-ctl reconfigure command. Regenerate the key without password protection from this file as follows:
```bash
sudo openssl rsa -des3 -in  /etc/gitlab/ssl/server.key -out privkey.pem
```

# Enable HTTPS Support With NGINX ✔️
🔸 Copy your SSL certificate and certificate key file to the specified locations.

🔸 Once you have copied all the server certificate files, you may make them readable by the root user only with the following commands:
```bash
sudo chown root:root /etc/gitlab/ssl/
sudo chmod 600 /etc/gitlab/ssl/
```

🔸 Run the following command to have the activation take effect:
```bash
sudo gitlab-ctl reconfigure
```

DONE.