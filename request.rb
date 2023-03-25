#!/usr/bin/env ruby
# frozen_string_literal: true

# Make request http to test API's
#
# == Parameters:
# url:
#   The URL to send the request
# method:
#   The HTTP method to use
# body:
#   The body of the request
#
# == Returns:
# A string representing the object in a specified
# format.
#
# == Examples:
# ruby script.rb --url https://example.com/api --method GET --header "Authorization: Bearer token" --body '{"key": "value"}'
#
require 'json'
require 'optparse'
require 'open-uri'

# Set default values
url = ''
method = 'GET'
headers = {}
body = {}

# Parse command line arguments
OptionParser.new do |opts|
  opts.on('-u', '--url URL', 'URL to request') { |u| url = u }
  opts.on('-m', '--method METHOD', 'HTTP method to use (default is GET)') { |m| method = m }
  opts.on('-h', '--header HEADER', 'Header to include in the request') do |h|
    key, value = h.split(':')
    headers[key] = value.strip
  end
  opts.on('-b', '--body BODY', 'Body to include in the request') { |b| body = JSON.parse(b) }
end.parse!

# Make the HTTP request
response = URI.open(url, method:, headers:, body: body.to_json).read
data = JSON.parse(response)

# Print the response
puts data
