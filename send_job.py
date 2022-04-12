#!/usr/bin/env python3
"Submit a job to AWS Batch."

import boto3

batch = boto3.client("batch")

response = batch.submit_job(
    jobName="jdoe-test-job",  # use your HutchNet ID instead of 'jdoe'
    jobQueue="example_batch_queue",  # sufficient for most jobs
    jobDefinition="batch_example_jobdefinition:27",  # use a real job definition
    containerOverrides={
        "command": [
            "python",
            "entry_shell.py",
            "echo",
            "ECHHOO Hello, World!",
        ],  # optionally override command
        "environment": [  # optionally set environment variables
            {"name": "FAVORITE_COLOR", "value": "blue"},
            {"name": "FAVORITE_MONTH", "value": "December"},
        ],
    },
)

print("Job ID is {}.".format(response["jobId"]))
