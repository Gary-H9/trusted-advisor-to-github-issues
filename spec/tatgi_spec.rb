require_relative "../lib/main"
#require 'json'


describe "parse_json()" do 
  it "successfully parses the test fixture all.json" do
    result = parse_json("spec/fixtures/all.json")
    expect(result).to eq("Qch7DwouX1")
  end
end

describe "generate_array()" do
  it "creates an array" do
    result = generate_array("spec/fixtures/all.json")
    expect(result.class).to eq(Array)
  end
  it "is non-empty" do 
    result = generate_array("spec/fixtures/all.json")
    expect(result.length).to be > 0 
  end 
end

describe "name_id()" do
  it "supplies 'description' field for specific 'id'" do
    result = name_id("spec/fixtures/all.json", parse_json("spec/fixtures/all.json"))
    expect(result).to eq("Low Utilization Amazon EC2 Instances")
  end
end

describe "describe_id()" do
  it "supplies 'description' field for specific 'id'" do
    result = describe_id("spec/fixtures/all.json", parse_json("spec/fixtures/all.json"))
    expect(result).to eq("Checks the Amazon Elastic Compute Cloud (Amazon EC2) instances that were running at any time during the last 14 days and alerts you if the daily CPU utilization was 10% or less and network I/O was 5 MB or less on 4 or more days. Running instances generate hourly usage charges. Although some scenarios can result in low utilization by design, you can often lower your costs by managing the number and size of your instances.\n<br><br>\nEstimated monthly savings are calculated by using the current usage rate for On-Demand Instances and the estimated number of days the instance might be underutilized. Actual savings will vary if you are using Reserved Instances or Spot Instances, or if the instance is not running for a full day. To get daily utilization data, download the report for this check. \n<br>\n<br>\n<b>Alert Criteria</b><br>\nYellow: An instance had 10% or less daily average CPU utilization and 5 MB or less network I/O on at least 4 of the previous 14 days.<br>\n<br>\n<b>Recommended Action</b><br>\nConsider stopping or terminating instances that have low utilization, or scale the number of instances by using Auto Scaling. For more information, see <a href=\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html\" target=\"_blank\">Stop and Start Your Instance</a>, <a href=\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html\" target=\"_blank\">Terminate Your Instance</a>, and <a href=\"http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/WhatIsAutoScaling.html\" target=\"_blank\">What is Auto Scaling?</a><br>\n<br>\n<b>Additional Resources</b><br>\n<a href=\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-monitoring.html\" target=\"_blank\">Monitoring Amazon EC2</a><br>\n<a href=\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html\" target=\"_blank\">Instance Metadata and User Data</a><br>\n<a href=\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/Welcome.html\" target=\"_blank\">Amazon CloudWatch Developer Guide</a><br>\n<a href=\"http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/WhatIsAutoScaling.html\" target=\"_blank\">Auto Scaling Developer Guide</a>")
  end
end

