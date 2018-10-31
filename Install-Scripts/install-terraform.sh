curl -O https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip

sudo yum install unzip

sudo mkdir /bin/terraform

sudo unzip terraform_0.11.10_linux_amd64.zip -d /usr/local/bin/

terraform --version