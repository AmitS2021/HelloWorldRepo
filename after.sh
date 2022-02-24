echo "Deploying to $DEPLOYMENT_GROUP_NAME environment..."
echo "User is: $USER" 

echo "cd to path..."
cd /var/www/html/telmyportal/

echo "Clearing local changes..."
git checkout .

sudo mv ../vendor .
sudo mv ../uploads frontend/web

echo "Doing environment init ($DEPLOYMENT_GROUP_NAME)..."
sudo ./init --env=$DEPLOYMENT_GROUP_NAME --overwrite=a

echo "Doing migrate..."
echo 'yes' | ./yii migrate

echo "Doing composer update..."
./composer.phar update --no-interaction

echo "Done!"

