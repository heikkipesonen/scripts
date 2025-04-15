
service_name="graphql"
service_location="/Users/heikki.pesonen/Documents"
path="$service_location/voikukka/services/backend/$service_name/__development"
target="$service_location/herkku-web-store/.env.local"

env_file=$(ls $path/dev*.json | egrep -o dev[0-9]+) 
env_url="https://api-$env_file.dev.s-kaupat.dev"

echo $env_url | pbcopy
echo "[$env_url] copied to clipboard"