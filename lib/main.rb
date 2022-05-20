require "json"

def helloworld
  p "hello world"
end

def parse_json(file)
  data = JSON.parse(File.read(file))
  string = data["checks"][0]["id"]
end

def generate_array(file)
  data = JSON.parse(File.read(file))
 
  checks = data["checks"]
  checks.each { |check| puts check["id"] }
end

