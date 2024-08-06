# Automate Image Upload to S3 with Lambda, EventBridge, and CloudWatch

## Introduction

Automating the image upload process to Amazon S3 with AWS Lambda, and EventBridge not only streamlines the workflow but also opens up opportunities for advanced image processing.

In this section, I will be exploring how you can use the images stored in my S3 bucket for detection through Amazon Rekognition, specifically focusing on Rekognition Custom Labels.

## Prerequisites

Ensure you have the following in place:

- AWS account with necessary permissions.
- Terraform installed locally.


## Workflow Overview

1. **Manual Image Upload:**
   - Users upload images to their remote repository.
   - Images are then uploaded to an S3 bucket via a Terraform configuration.

2. **S3 Event Trigger:**
   - Configure S3 bucket to generate events for `PutObject` actions.

3. **Lambda Function:**
   - Set up a Lambda function to process uploaded images.
   - Grant Lambda necessary IAM permissions for S3 access.

4. **EventBridge Rule:**
   - Create an EventBridge rule to trigger Lambda on S3 events.
   - Customize the rule to match `PutObject` events.


   ## Amazon Rekognition Custom Labels Integration


**Rekognition Setup:**
   - Ensure you have the Amazon Rekognition service and specifically **Rekognition Custom Labels** enabled in your AWS account.

 **Custom Labels Project:**
   - Create a Rekognition Custom Labels project in the AWS Management Console.
   - Choose "Image" as the project type.

 **S3 Bucket for Custom Labels:**
   - Use an existing S3 bucket or create a new one for storing training data and results.

 **Labeling Your Images:**
   - Label images in your S3 bucket for training. This is a crucial step for Rekognition Custom Labels to learn and identify specific objects.

 **Lambda-Amazon Rekognition Custom Labels Integration:**
   - Enhance your Lambda function to integrate with Rekognition Custom Labels using the AWS SDK for image analysis.



## My Process
I’m working on automating the image upload process to my S3 bucket in AWS. I’ve successfully accomplished the initial steps with my [Test-images](https://github.com/Firdous2307/aws-rekognition-with-messi-or-ronaldo/tree/main/test-images). Although I might still update it later. Stay tuned.


Next, I wrote Terraform configurations for my S3 module to:

- Create an S3 bucket with the given name.
- Set the bucket ownership to **BucketOwnerPreferred**.
- Enable EventBridge notifications for the bucket.
- Upload objects(images in this case) from a specified local directory to the S3 bucket.
- Sets the bucket access control list (ACL) to **private**.
- Enables versioning for the bucket.


Next, I developed a JavaScript Lambda function to process the uploaded images and configured an EventBridge rule to trigger the function on S3 events.

I was able to include the dependencies with the [lambda function code](https://github.com/Firdous2307/aws-rekognition-with-messi-or-ronaldo/tree/main/lambda-function)


For My Lambda Module, I wrote Terraform configurations to 

- Set up AWS provider with the specified region.
- Create IAM role for Lambda with assume role policy.
- Attach basic execution policy for logging.
- Attach S3 access policy to Lambda role.
- CloudWatch Logs group for Lambda logs.
- Package Lambda function code into a ZIP file.
- Deploy Lambda function with specified code, role, and environment variables.



Then, My EventBridge Module, I had a little challenge doing this, i will talk about it shortly, but first I would like to go over what i was able to achieve in this module using Terraform Configurations.

- Configured the AWS provider with the specified region.
- Defined variables for the S3 bucket ARN and Lambda function ARN.
- Created a CloudWatch event rule to trigger the Lambda function on S3 object creation.
- Setup the Lambda function as the target for the CloudWatch event rule.
- Grants S3 permission to invoke the Lambda function via the CloudWatch event.





## Issues Faced

Firstly, one of the challenges I encountered during this lengthy process, while it was both exciting and engaging, was AWS Credentials. It is really important to keep your credentials safe and secure as well as ensuring you use the 

## Terraform Configuration

### Modules

[S3 Module](https://github.com/Firdous2307/aws-rekognition-with-messi-or-ronaldo/tree/main/modules/s3)

[Lambda Module](https://github.com/Firdous2307/aws-rekognition-with-messi-or-ronaldo/tree/main/modules/lambda)


[EventBridge Module](https://github.com/Firdous2307/aws-rekognition-with-messi-or-ronaldo/tree/main/modules/eventbridge)

[]