echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list &&
echo "deb-src http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list &&

echo "deb http://deb.debian.org/debian-security/ bullseye-security main" >> /etc/apt/sources.list &&
echo "deb-src http://deb.debian.org/debian-security/ bullseye-security main" >> /etc/apt/sources.list &&

echo "deb http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list &&
echo "deb-src http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list &&
sudo apt update &&
apt upgrade -y &&
