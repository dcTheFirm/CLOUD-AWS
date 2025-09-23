## 1. S3 bucket in AWS

## Bucket Details

* **Bucket Name:** my-bucket120012
* **Region:** eu-north-1
* **Files in Bucket:** index.html, quote.png
* **Bucket Creation Criteria:**

  * Versioning enabled for object recovery
  * Default encryption (SSE-S3) enabled for all objects
  * Block Public Access enabled initially for security
<img width="1511" height="691" alt="Screenshot From 2025-09-23 18-39-53" src="https://github.com/user-attachments/assets/d7a7c4f4-6873-479d-98ec-fc458b69d45d" />
---

## Step 1: Configure AWS CLI

Make sure AWS CLI is installed. Configure it with your IAM credentials:

```bash
aws configure
```

Enter the following:

```
AWS Access Key ID [None]: <Your Access Key ID>
AWS Secret Access Key [None]: <Your Secret Access Key>
Default region name [None]: eu-north-1
Default output format [None]: json
```

Test CLI credentials:

```bash
aws s3 ls
```

---

## Step 2: Upload Files (if not already uploaded)

```bash
aws s3 cp ./index.html s3://my-bucket120012/ --region eu-north-1
aws s3 cp ./quote.png s3://my-bucket120012/ --region eu-north-1
```

* Uploaded files are versioned and encrypted.

---

## Step 3: Generate Pre-Signed URL (Secure Demo)

Temporary URL valid for 1 hour:

```bash
aws s3 presign s3://my-bucket120012/quote.png --expires-in 3600 --region eu-north-1
```

* Open the link in browser to view the image.
* This URL will expire after 1 hour.

**Output Screenshot:** *
<img width="1420" height="261" alt="Screenshot From 2025-09-23 19-03-28" src="https://github.com/user-attachments/assets/30680cc9-8958-4377-9fd1-76a2d2633c40" />

<img width="1920" height="1080" alt="Screenshot From 2025-09-23 18-39-19" src="https://github.com/user-attachments/assets/bc9ceae1-d56a-4047-8a8b-0200498d116b" />


## Step 4: Public Access (Permanent)

Make the image publicly readable:

```bash
aws s3api put-object-acl --bucket my-bucket120012 --key quote.png --acl public-read --region eu-north-1
```

Public URL:

```
https://my-bucket120012.s3.eu-north-1.amazonaws.com/quote.png
```

* Open this URL in a browser to view the image.

**Output Screenshot:** *(attach image showing public access test)*

---

## Step 5: Bucket Policy for Full Public Access

(Optional) Make all objects in the bucket public:

1. Disable "Block Public Access" in AWS Console for this bucket.
2. Apply this bucket policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::my-bucket120012/*"
    }
  ]
}
```

* Any object URL will now be accessible publicly.

**Output Screenshot:** *(attach image showing bucket policy applied)*

---

## Step 6: Static Website Hosting

1. Upload website files if not done already.
2. Go to bucket → **Properties → Static Website Hosting → Enable**
3. Choose "Host a static website"

   * Index document = `index.html`
   * Error document = `error.html` (optional)
4. Save → Endpoint URL given by AWS:

```
http://my-bucket120012.s3-website.eu-north-1.amazonaws.com
```

* Open in browser → website live.

**Output Screenshot:** *(attach image showing live website)*

---

## Step 7: Summary of Commands Used

```bash
# Configure AWS CLI
aws configure

# List Buckets
aws s3 ls

# Upload files to bucket
aws s3 cp ./index.html s3://my-bucket120012/ --region eu-north-1
aws s3 cp ./quote.png s3://my-bucket120012/ --region eu-north-1

# Generate pre-signed URL
aws s3 presign s3://my-bucket120012/quote.png --expires-in 3600 --region eu-north-1

# Make object public
aws s3api put-object-acl --bucket my-bucket120012 --key quote.png --acl public-read --region eu-north-1
```
<img width="1455" height="854" alt="Screenshot From 2025-09-23 18-51-21" src="https://github.com/user-attachments/assets/944f09f6-ce63-44a0-a8fe-58bf83b31b54" />



## Step 7: Analyze Errors if Object is outside the current AZ Region

<img width="1455" height="854" alt="Screenshot From 2025-09-23 18-58-38" src="https://github.com/user-attachments/assets/d62a3958-1d1b-46dd-93be-554c8d306500" />

## ✅ What I Learned

* How to **create an S3 bucket** with proper security: versioning, encryption, and public access controls.
* How to **upload files** via AWS CLI.
* How to **generate pre-signed URLs** for temporary secure access.
* How to make **objects public** via ACL and bucket policy.
* How to **host a static website** on S3.
* How to use **AWS CLI commands** efficiently.
* Importance of **region awareness** and **object-level permissions**.
* Analyzing Errors  on the web if the object was deleted.
  





