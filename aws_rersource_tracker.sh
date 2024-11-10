#!/bib/bash


###############################
#Author: Nishant
#Date: 11/10/2024
#
#Version: v1
#
#This script will report the AWS resource usage
##############################

set -x

#This is the outout file
OUTPUT_FILE="resourceTracker"

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users


#List s3 buckets
echo "Print list of S3 buckets" >> "$OUTPUT_FILE"
aws s3 ls >> "$OUTPUT_FILE" 2>&1

#List EC2 Instances
echo "Print list of EC2" >> "$OUTPUT_FILE" 
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$OUTPUT_FILE" 2>&1

#List lambda function
echo "Print list of lambda function" >> "$OUTPUT_FILE"
aws lambda list-functions "$OUTPUT_FILE" 2>&1

#List IAM Users
echo "Print list of IAM Users" >> "$OUTPUT_FILE"
aws iam list-users >> "$OUTPUT_FILE" 2>&1
