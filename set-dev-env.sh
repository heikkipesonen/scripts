service_name="graphql"
service_location="/Users/heikki.pesonen/Documents"
path="$service_location/voikukka/services/backend/$service_name/__development"
target_config_file="$service_location/herkku-web-store/.env.local"

# default_api_url=https://api.test.s-kaupat.dev/

# Check if reset parameter is provided
if [ "$1" == "reset" ]; then
  echo "Resetting dev env - commenting out NEXT_PUBLIC_TEST_API_URL"
  if grep -q "^NEXT_PUBLIC_TEST_API_URL" "$target_config_file"; then
    sed -i '' "s|^NEXT_PUBLIC_TEST_API_URL|#NEXT_PUBLIC_TEST_API_URL|" "$target_config_file"
    echo "Commented out NEXT_PUBLIC_TEST_API_URL in $target_config_file"
  else
    echo "NEXT_PUBLIC_TEST_API_URL not found or already commented out"
  fi
  exit 0
fi

env_file=$(ls $path/dev*.json | egrep -o dev[0-9]+) 
env_url="https://api-$env_file.dev.s-kaupat.dev"

next_public_api_test_url="NEXT_PUBLIC_TEST_API_URL=$env_url"


# clear the terminal
clear
echo "-------------------------"
echo "Updating $target_config_file with $env_url"
# replace NEXT_PUBLIC_TEST_API_URL in .env.local
if grep -q "#NEXT_PUBLIC_TEST_API_URL" "$target_config_file"; then
  echo "Found commented line, replacing it with [$next_public_api_test_url]"
  sed -i '' "s|#NEXT_PUBLIC_TEST_API_URL=.*|$next_public_api_test_url|" "$target_config_file"
elif grep -q "NEXT_PUBLIC_TEST_API_URL" "$target_config_file"; then
  echo "Found existing line, replacing it with [$next_public_api_test_url]"
  sed -i '' "s|NEXT_PUBLIC_TEST_API_URL=.*|$next_public_api_test_url|" "$target_config_file"
else 
  # if the line does not exist, add it to the end of the file
  echo "Adding new line to the end of the file"
  echo "NEXT_PUBLIC_TEST_API_URL=$env_url" >> "$target_config_file"
  echo "$next_public_api_test_url" >> "$target_config_file"
fi
echo "Updated $target_config_file with $env_url"