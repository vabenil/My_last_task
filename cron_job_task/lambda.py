import json
import urllib.parse
import boto3

print('Loading function')

region = 'eu-central-1'
ec2 = boto3.client('ec2', region_name=region)


def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))
    ec2_client = boto3.client('ec2')

    # Specify the instance ID to start or stop
    instance_id = 'i-0a52300d562451b6c'

    # Get information about the instance
    instance = ec2_client.describe_instances(InstanceIds=[instance_id])

    # Check the current state of the instance
    current_state = instance['Reservations'][0]['Instances'][0]['State']['Name']

    # Start or stop the instance based on its current state
    if current_state == 'stopped':
        ec2_client.start_instances(InstanceIds=[instance_id])
        return f"Starting instance {instance_id}..."
    elif current_state == 'running':
        ec2_client.stop_instances(InstanceIds=[instance_id])
        return f"Stopping instance {instance_id}..."
    else:
        return f"Instance {instance_id} is in an unknown state: {current_state}"
