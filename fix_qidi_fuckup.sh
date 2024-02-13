echo "Fixing Qidi's fuckup...\n"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install ntp ca-certificates -y
sudo update-ca-certificates
echo "\nDone. Enjoy."
