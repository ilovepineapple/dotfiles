#!/bin/bash

# Parse command line arguments
while getopts ":u:m:h:b:" opt; do
  case $opt in
    u)
      url="$OPTARG"
      ;;
    m)
      method="$OPTARG"
      ;;
    h)
      headers="$headers -H $OPTARG"
      ;;
    b)
      body="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Make the curl request
response=$(curl -s -X "$method" $headers -d "$body" "$url")

# Print the response
echo "$response"

# ./script.sh -u https://example.com/api -m GET -h "Authorization: Bearer token" -b '{"key": "value"}'
