require "json"

def parse_json(file)
  data = JSON.parse(File.read(file))
  string = data["checks"][0]["id"]
end

def generate_array(file)
  data = JSON.parse(File.read(file))
  checks = data["checks"]
end

def name_id(file,id)
  array = generate_array(file)
  hash = array.find { |n| n["id"] == id }
  hash["name"]
end

def describe_id(file,id)
  array = generate_array(file)
  hash = array.find { |n| n["id"] == id }
  hash["description"]
end
