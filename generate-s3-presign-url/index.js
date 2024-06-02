const express = require('express');
const AWS = require('aws-sdk');
const app = express();
const port = 3000;

app.use(express.json());

// Hàm tạo presigned URL
function generatePresignedUrl(key, bucketName, expire, accessKeyId, secretAccessKey) {
    AWS.config.update({
        accessKeyId: accessKeyId,
        secretAccessKey: secretAccessKey,
        region: 'us-east-1' // Thay thế bằng vùng của bạn
    });

    const s3 = new AWS.S3();

    const params = {
        Bucket: bucketName,
        Key: key,
        Expires: expire
    };

    return s3.getSignedUrl('getObject', params);
}

// Route để nhận request và trả về presigned URL
app.post('/generate-presigned-url', (req, res) => {
    const { key, bucketName, expire, accessKeyId, secretAccessKey } = req.body;

    if (!key || !bucketName || !expire || !accessKeyId || !secretAccessKey) {
        return res.status(400).json({ error: 'Missing required fields' });
    }

    const presignedUrl = generatePresignedUrl(key, bucketName, expire, accessKeyId, secretAccessKey);
    res.json({ presignedUrl });
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
