# Notes 

## AWS Trusted Advisor 🕵️‍♂️

```
aws support describe-trusted-advisor-checks --language "en" --region us-east-1
```

⚠️ You need to specify the region as `us-east-1` or you will receive no response. 

Details on this command [here](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/support/describe-trusted-advisor-checks.html).

This command will respond with information such as the below:

```
{
    "checks": [
        {
            "id": "Qch7DwouX1",
            "name": "Low Utilization Amazon EC2 Instances",
            "description": "Checks the Amazon Elastic Compute Cloud (Amazon EC2) instances that were running at any time during the last 14 days and alerts you if the daily CPU utilization was 10% or less and network I/O was 5 MB or less on 4 or more days. Running instances generate hourly usage charges. Although some scenarios can result in ...
            ...
                "Instance Name",
                "Instance Type",
                "Estimated Monthly Savings",
                "Day 1",
                "Day 2",
                "Day 3",
                "Day 4",

```

From this output we want are primarily concerned with the `id`. This will allow us to use the following command:

```
aws support describe-trusted-advisor-check-result --language "en" --region us-east-1 --check-id Qch7DwouX1
```

To gather this output: 

```
{
    "result": {
        "checkId": "Qch7DwouX1",
        "timestamp": "2022-04-26T14:14:36Z",
        "status": "warning",
        "resourcesSummary": {
            "resourcesProcessed": 1,
            "resourcesFlagged": 1,
            "resourcesIgnored": 0,
            "resourcesSuppressed": 0
        },
        "categorySpecificSummary": {
            "costOptimizing": {
                "estimatedMonthlySavings": 9.504000000000001,
                "estimatedPercentMonthlySavings": 1.0000000000000002
            }
        },
        "flaggedResources": [
            {
                "status": "warning",
                "region": "eu-west-2",
                "resourceId": "xaJMo4Hj-M0Xv0YzWGomi5dWP2v3o8ujM2LxVTxJA8Y",
                "isSuppressed": false,
                "metadata": [
                    "eu-west-2c",
                    "i-0c2f172a2e4ac1631",
                    "Heartbeat instance",
                    "t2.micro",
                    "$9.50",
                    "1.3%  0.06MB",
                    ...
                    ...
                    "14 days"
                ]
            }
        ]
    }
}
```

We want to be able to do this for _all_ Trusted Advisor Checks however so we need every ID. To gather this we can us `jq` like this: 

```
aws support describe-trusted-advisor-checks --language "en" --region us-east-1 | jq .checks[].id
```

This will give this output: 
```
"Qch7DwouX1"
"hjLMh88uM8"
"DAvU99Dc4C"
"Z4AUBRNSmz"
"HCP4007jGY"
"1iG5NDGVre"
"zXCkfM1nI3"
"Pfx0RwqBli"
"7DAFEmoDos"
"Yw2K9puPzl"
...
```

In our production account this total 230 separate IDs! Did someone say _arrays_? More on that later. 

## GitHub Issue 🤔
 
The previous output is going to form the skeleton of our GitHub Issue.

From this point we want to create a ticket using the GitHub API (documentation [here](https://docs.github.com/en/rest/issues/issues#create-an-issue)): 

```
curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/OWNER/REPO/issues \
  -d '{"title":"Found a bug","body":"I'm having a problem with this.","assignees":["octocat"],"milestone":1,"labels":["bug"]}'
```

From this we can see that we need to populate a number of variables: 

| Variable        | Input |
| --------------- | ----------- |
| `OWNER`         | ministryofjustice |
| `REPO`          | cloud-operations  |
| `title`         | `name`            |
| `body`          | `description`     |

The variables `title` and `body` will be populated by `name` and `description` from the AWS output from the start.  

The `REPO` variable will be cloud-operations for now. This can be further developed in future. 

This means our command will be 

## Tying it all Together




## Future Features ✨
- Post to different repositories

## Issues
- Some account may need to be created to post the issue in github 