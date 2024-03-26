const AWS = require('aws-sdk');

const s3 = new AWS.S3();

exports.handler = async (event) => {
    const bucket = process.env.BUCKET_NAME;

    // List objects in the S3 bucket
    const listObjectsParams = {
        Bucket: bucket,
    };

    try {
        const { Contents } = await s3.listObjects(listObjectsParams).promise();

        // Iterate through each object in the bucket
        for (const object of Contents) {
            const key = object.Key;

            // Perform an action on each object (e.g., log the key)
            console.log(`Processing S3 object: ${key}`);
        }

        return {
            statusCode: 200,
            body: JSON.stringify('S3 object processing complete'),
        };
    } catch (error) {
        console.error('Error listing objects in S3 bucket:', error);

        return {
            statusCode: 500,
            body: JSON.stringify('Internal Server Error'),
        };
    }
};
