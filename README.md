# phase-6

## Launching an EC2 instance with the AWS CLI

Install and configure the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) with credentials that can manage EC2 instances. Set the values below to match your AWS account and instance configuration; the region defaults to `ap-south-2`.

### Option 1: AWS CLI one-liner

Replace the placeholders with your AMI, instance type, key pair, and security group:

```bash
aws ec2 run-instances --image-id <ami-id> --instance-type <instance-type> --count 1 --key-name <key-pair-name> --security-group-ids <security-group-id> --region ap-south-2
```

To terminate an instance:

```bash
aws ec2 terminate-instances --instance-ids <instance-id> --region ap-south-2
```

### Option 2: Reusable scripts

Set the required launch configuration in your shell, then run `launch.sh`:

```bash
export AMI_ID=<ami-id>
export INSTANCE_TYPE=<instance-type>
export KEY_NAME=<key-pair-name>
export SECURITY_GROUP_ID=<security-group-id>
export AWS_REGION=ap-south-2
bash launch.sh
```

`SUBNET_ID` is optional. When set, the instance is launched in that subnet.

The script prints the new instance ID. Pass that ID to `terminate.sh` to terminate the instance:

```bash
bash terminate.sh <instance-id>
```

Both scripts use `AWS_REGION` when set and otherwise default to `ap-south-2`.
