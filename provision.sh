TF_VERSION="0.9.5"
TF_INSTALL_DIR="/usr/local/bin"
TF_DOWNLOAD_DIR="/tmp"
TF_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
TF_DOWNLOADED_FILE="$TF_DOWNLOAD_DIR/terraform.zip"

sudo apt-get update
sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential git unzip apt-transport-https ca-certificates curl

# install terraform
curl $TF_DOWNLOAD_URL -o $TF_DOWNLOADED_FILE
sudo unzip -o $TF_DOWNLOADED_FILE -d $TF_INSTALL_DIR

# install azure cli
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
sudo apt-get update && sudo apt-get install azure-cli

# install kubernetes cli
sudo az acs kubernetes install-cli

# install docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce

# install nodejs 7
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo usermod -a -G docker vagrant