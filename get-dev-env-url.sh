
service_name="graphql"
service_location="/Users/heikki.pesonen/Documents"
path="$service_location/voikukka/services/backend/$service_name/__development"

dev_json_file=$(ls $path/dev*.json)
api_domain=$(jq -r '.SKaupatApiDomain' "$dev_json_file")
env_url="https://$api_domain"

echo $env_url | pbcopy
echo "[$env_url] copied to clipboard"