# Function to display error message and exit
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

echo "Installing packages..."
# Install packages
sudo apt update || error_exit "Failed to update package repositories."
sudo apt install -y tmux crunch apache2 php php-curl certbot python3-certbot-apache git net-tools libpcap-dev build-essential libssl-dev curl jq zip || error_exit "Failed to instal>

echo "Installing Python..."
# Install Python
apt install -y software-properties-common || error_exit "Failed to install Python software-properties-common."
add-apt-repository -y ppa:deadsnakes/ppa || error_exit "Failed to install deadsnakes ppa."
apt-get update && apt-cache search python3.1 || error_exit "Failed to install Python."
apt-get install python3.11 -y || error_exit "Failed to install Python."
ln -s /usr/bin/python3.11 /usr/bin/python || error_exit "Failed to create symbolic link for Python."
python --version || error_exit "Python installation failed."

echo "Installing Docker..."
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh ./get-docker.sh || error_exit "Failed to install Docker."

echo "Installing Go..."
# Install Go
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz || error_exit "Failed to download Go archive."
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz || error_exit "Failed to extract Go archive."
export PATH=$PATH:/usr/local/go/bin || error_exit "Failed to set Go environment variables."
source $HOME/.profile || error_exit "Failed to source profile."
go version || error_exit "Go installation failed."


echo "Installing tools..."
# Install tools
go install github.com/projectdiscovery/notify/cmd/notify@latest &> /dev/null || echo "Failed to install notify."
go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest &> /dev/null || echo "Failed to install mapcidr."
go install github.com/ffuf/ffuf/v2@latest &> /dev/null || echo "Failed to install ffuf."
go install github.com/tomnomnom/unfurl@latest &> /dev/null || echo "Failed to install unfurl."
go install github.com/projectdiscovery/httpx/cmd/httpx@latest &> /dev/null || echo "Failed to install httpx."
go install github.com/bp0lr/gauplus@latest &> /dev/null || echo "Failed to install gauplus."
go install github.com/projectdiscovery/katana/cmd/katana@latest &> /dev/null || echo "Failed to install katana."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest &> /dev/null || echo "Failed to install subfinder."
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest &> /dev/null || echo "Failed to install dnsx."
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest &> /dev/null || echo "Failed to install shuffledns."
go install github.com/tomnomnom/anew@latest &> /dev/null || echo "Failed to install anew."
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &> /dev/null || echo "Failed to install nuclei."
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz;rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz;export PATH=$PATH:/usr/local/go/bin;source $HOME/.profile;go version;


echo "Installation complete."