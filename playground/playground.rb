require "json"
require 'octokit'

file = "spec/fixtures/all.json"

def generate_array(file)
  data = JSON.parse(File.read(file))
  array = []
  
  checks = data["checks"]
  checks.each { |check| array.join(check["id"]) }
  # we have an array of all checks which looks like:
  # [ {"id"=>"abc123", "name"=>"bla bla", ...}, {"id"=>"abc124", "name"=>"blb blb", ...}]
  # puts array.find { |n| n['id'] == "Qch7DwouX1" }
  thing = checks.find { |n| n["id"] == "Qch7DwouX1" }
  puts thing["id"]
  puts thing["name"]
  puts thing["description"]
  
end




# Provide authentication credentials
#client = Octokit::Client.new(:login => 'defunkt', :password => 'c0d3b4ssssss!')

# Set access_token instead of login and password if you use personal access token
client = Octokit::Client.new(:access_token => '')

# Fetch the current user
client.user
# Create issue
client.create_issue("ministryofjustice/cloud-operations", 'title', 'body')



## Stub reference
stub_request(:post, ENV.fetch("KEA_CONTROL_AGENT_URI"))
.with(body: {
  command: "lease4-del",
  service: ["dhcp4"],
  arguments: {
    "ip-address" => ip_address
  }
},
  headers: {
    "Content-Type" => "application/json"
  })
.to_return(body: kea_response_lease_destroyed)