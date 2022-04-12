#!/usr/bin/env python3
"Submit a job to AWS Batch."
from pprint import pprint
import boto3

batch = boto3.client("batch")

result = batch.describe_job_definitions(
    jobDefinitionName="batch_example_jobdefinition", status="ACTIVE"
)

job_def_name = None
latest = 0  # latest version of the job definition
for job_def in result["jobDefinitions"]:
    if job_def["revision"] > latest:
        latest = job_def["revision"]
        job_def_name = job_def["jobDefinitionName"] + ":" + str(latest)
        # pprint(job_def_name)

if job_def_name is None:
    raise ValueError("No job definition found")
else:
    print(f"Found job definition {job_def_name}")
    print("Submitting job...")
    response = batch.submit_job(
        jobName="jdoe-test-job",  # use your HutchNet ID instead of 'jdoe'
        jobQueue="example_batch_queue",  # sufficient for most jobs
        jobDefinition="batch_example_jobdefinition:28",  # use a real job definition
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
