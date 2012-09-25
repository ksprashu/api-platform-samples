
echo This deletes all entities created by Apigee script 'apiSetup.sh'

echo "Enter your USERNAME (the email you use to login to enterprise.apigee.com/login), followed by [ENTER]:"
read username

echo "Enter your PASSWORD (the password you use to login to enterprise.apigee.com/login), followed by [ENTER]:"
read -s password

echo "Enter the name of your Apigee ORGANIZATION (check settings in enterprise.apigee.com/login), followed by [ENTER]:"
read org

echo using $username and $org

echo Delete App Family

curl -u $username:$password https://api.enterprise.apigee.com/v1/o/$org/developers/"ntesla@theramin.com"/appfamilies/WeatherApps -X DELETE

echo Delete App

curl -u $username:$password -H "Accept: application/json" -X DELETE https://api.enterprise.apigee.com/v1/o/$org/developers/ntesla%40theramin%2Ecom/apps/weatherapp

echo Delete Prod App

curl -u $username:$password -H "Accept: application/json" -X DELETE https://api.enterprise.apigee.com/v1/o/$org/developers/ntesla%40theramin%2Ecom/apps/weatherapp_prod

echo Delete Developer

curl -u $username:$password -H "Accept: application/json" -X DELETE https://api.enterprise.apigee.com/v1/o/$org/developers/ntesla%40theramin%2Ecom


echo Delete API Product Manual

curl -u $username:$password -H "Accept: application/json" -X DELETE https://api.enterprise.apigee.com/v1/o/$org/apiproducts/weather_free > ./responses/DeleteAPIProduct-manual.json

echo Delete API Product Auto

curl -u $username:$password -H "Accept: application/json" -X DELETE https://api.enterprise.apigee.com/v1/o/$org/apiproducts/weather_premium

echo Undeploy Revision 1 from Test Environment

curl -u $username:$password -H "Content-type:application/octet-stream" -X POST https://api.enterprise.apigee.com/v1/o/$org/apis/weatherAPI/deployments?'action=undeploy&env=test&revision=1' 


echo Undeploy Revision 1 from Prod Environment

curl -u $username:$password -H "Content-type:application/octet-stream" -X POST https://api.enterprise.apigee.com/v1/o/$org/apis/weatherAPI/deployments?'action=undeploy&env=prod&revision=1' > ./responses/Undeploy.json

echo Delete API

curl -u $username:$password -H "Accept: application/json" -X DELETE https://api.enterprise.apigee.com/v1/o/$org/apis/weatherAPI