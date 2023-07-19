# Function to display error message and exit
error_exit() {
  echo "Error: $1" >&2
}

echo "Installing packages..."
# Install packages
sudo apt update -y && apt upgrade -y || error_exit "Failed to update package repositories."
sudo apt install -y tmux crunch apache2 php php-curl certbot python3-certbot-apache git net-tools libpcap-dev build-essential libssl-dev curl jq zip || error_exit "Failed to install deps"

echo "Installing Python..."
# Install Python
apt install -y software-properties-common || error_exit "Failed to install Python software-properties-common."
add-apt-repository -y ppa:deadsnakes/ppa || error_exit "Failed to install deadsnakes ppa."
apt-get update && apt-cache search python3.1 || error_exit "Failed to install Python."
apt-get install python3.11 -y || error_exit "Failed to install Python."
python --version || error_exit "Python installation failed."

echo "Installing Docker..."
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh ./get-docker.sh || error_exit "Failed to install Docker."

echo "Installing Go..."
# Install Go
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz || error_exit "Failed to download Go archive."
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz || error_exit "Failed to extract Go archive."
export PATH=$PATH:/usr/local/go/bin || error_exit "Failed to set Go environment variables."
source ~/.profile || error_exit "Failed to source profile."
go version || error_exit "Go installation failed."


echo "Installing tools..."
# Install tools
go install github.com/projectdiscovery/notify/cmd/notify@latest &> /dev/null || echo "Failed to install notify."
go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest &> /dev/null || echo "Failed to install mapcidr."
go install github.com/ffuf/ffuf/v2@latest &> /dev/null || echo "Failed to install ffuf."
go install github.com/tomnomnom/unfurl@latest &> /dev/null || echo "Failed to install unfurl."
go install github.com/projectdiscovery/httpx/cmd/httpx@latest &> /dev/null || echo "Failed to install httpx."
go install github.com/lc/gau/v2/cmd/gau@latest &> /dev/null || echo "Failed to install gau."
go install github.com/projectdiscovery/katana/cmd/katana@latest &> /dev/null || echo "Failed to install katana."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest &> /dev/null || echo "Failed to install subfinder."
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest &> /dev/null || echo "Failed to install dnsx."
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest &> /dev/null || echo "Failed to install shuffledns."
go install github.com/tomnomnom/anew@latest &> /dev/null || echo "Failed to install anew."
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &> /dev/null || echo "Failed to install nuclei."
go install github.com/tomnomnom/waybackurls@latest&> /dev/null || echo "Failed to install waybackurls."
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest || echo "Failed to install waybackurls."
go install github.com/jaeles-project/gospider@latest || echo "Failed to install gospider."
go install github.com/ImAyrix/cut-cdn@latest || echo "Failed to install cut-cdn."
go install github.com/d3mondev/puredns/v2@latest || echo "Failed to install pureDns"
go install github.com/projectdiscovery/alterx/cmd/alterx@latest || echo "Failed to install alterX"
go install github.com/hakluke/hakrawler@latest || echo "Failed to install hakrawler"
go install github.com/hahwul/dalfox/v2@latest || echo "Failed to install dalfox"
go install github.com/tomnomnom/gf@latest || ecoh "Failed to install gf"
go install github.com/dwisiswant0/gfx@latest || echo "Faile to install gfx enhanced version of gf"
go install github.com/BishopFox/jsluice/cmd/jsluice@latest || echo "Failed to install jsluice"
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz;rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz;export PATH=$PATH:/usr/local/go/bin;source $HOME/.profile;go version;


echo "Installation complete."