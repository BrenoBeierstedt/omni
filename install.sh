printf "##### Building project database image..."
docker build -t omni-neo4j ./neo4j
printf "##### Building project base image..."
docker build -t omni-nodejs ./nodejs
printf "###Build Done!"

cd ..


printf "\n\n##### Cloning web front..."
git clone git@github.com:BrenoBeierstedt/omni-web.git

printf "\n\n##### Cloning backend..."
git clone git@github.com:BrenoBeierstedt/omni-api.git

printf "\n\n##### Copying composer..."
cp omni-platform/docker-compose.yml.sample docker-compose.yml

rm proxy.conf

echo "### Creating proxy.conf"
cat > proxy.conf <<EOL
server_tokens off;
client_max_body_size 200m;
EOL
echo " "

echo "
As last step you need to manually edit /etc/hosts 
in your PC (Mac and linux)

127.0.0.1   omni-web.local.com
127.0.0.1   omni-api.local.com
127.0.0.1   neo4j.local.com
"

cd omni

printf "\n\nAll done! Have a nice day!\n"