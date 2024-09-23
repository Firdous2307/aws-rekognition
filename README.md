# rekognition

## NEED TO FINISH THIS


draft planning

- aws rekoginition
- terraform
- ec2
- docker
- aws ecs
- s3
- cloudwatch
- aws polly?
- github actions?

- First off, I will try and implement the image/video upload using S3, Cloudwatch, EventBridge and AWS Lambda.


So I want to use the AWS Rekognition model that will be used to detect images of Ronaldo and Messi(might change this lagter, allow me brainstorm, the idea is there. Just need what to focus it on).
- Create a Dockerfile.
-  A flask application.
- Save my Docker Image to AWS ECR. 
- Store my Images on S3.
- Create EC2 Instances.





I added GitHub Actions workflow to ease the stress of manually creating a branch and also pushing it into the main branch(I am yet to test it but it should work)







Okay so this is my first time creating a Rekognition Custom Labels project, so Amazon Rekognition requires an S3 bucket to store my project files.

This will be done via the console, also i tried searching for terraform modules for aws-rekognition but to no avail, hmm I wonder why this is the case 
