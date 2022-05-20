require_relative "../lib/main"
#require 'json'

describe "test" do
  it "prints hello world" do
    result = helloworld
    expect(result).to eq("hello world")  
  end
end

describe "parse_json()" do 
  it "" do
    result = parse_json("spec/fixtures/all.json")
    expect(result).to eq("Qch7DwouX1")
  end
  it "creates an array" do
    result = generate_array("spec/fixtures/all.json")
    expect(result.class).to eq(Array)
  end
  it "is non-empty" do 
    result = generate_array("spec/fixtures/all.json")
    expect(result.length).to be > 0 
  end 
end

