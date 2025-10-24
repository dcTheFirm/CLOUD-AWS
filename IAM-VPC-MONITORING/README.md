# 🔐 AWS IAM Roles: When EC2 Meets S3 Securely

> **"The most secure credentials are the ones you never see"** - A practical demonstration of IAM Roles making cloud security seamless.

## 🌟 Hey there! Welcome to my project!

This is where I learned how to make EC2 instances and S3 buckets talk to each other securely - no password sharing required! Think of it as giving your EC2 instance a special security pass instead of a key that never expires.

## 🎯 The "Aha!" Moment

You know that feeling when something just works? That was me when I:
1. Created an EC2 instance with an IAM Role
2. SSH'd into it
3. Ran `aws s3 ls`
4. **And saw my buckets magically appear!** 🎉

No credentials configured, no secrets stored. Just pure AWS magic!

## 🏗️ What I Built (In Simple Terms)

### The Cast of Characters:
- **EC2 Instance** - Our hardworking server
- **IAM Role** - The special security pass
- **S3 Buckets** - The cloud storage
- **VPC** - The secure private neighborhood
- **Security Groups** - The friendly bouncers

### The Plot:
EC2 needs to access S3, but we don't want to give it permanent keys. So we create an IAM Role that says "Hey, this EC2 is allowed to access S3!" and AWS handles all the security behind the scenes.

## 🚀 Getting This Beauty Running

```bash
# 1. Set the stage
terraform init

# 2. Deploy the magic
terraform apply

# 3. See the magic happen!
ssh ec2-user@your-ec2-ip

aws s3 ls 
```

## Refer the Media for clarity..
aws s3 ls<img width="1910" height="926" alt="Screenshot From 2025-10-24 22-54-36" src="https://github.com/user-attachments/assets/b6b91f7c-272f-4abb-a0cb-35b7c6f1c025" />

<img width="1596" height="892" alt="Screenshot From 2025-10-24 22-41-52" src="https://github.com/user-attachments/assets/f8e516b8-05b2-4884-a14d-e717523a29d5" />

<img width="1584" height="1023" alt="Screenshot From 2025-10-24 22-38-55" src="https://github.com/user-attachments/assets/7199a4d3-45d1-458b-985e-d57854f04590" />

<img width="1584" height="1023" alt="Screenshot From 2025-10-24 22-38-28" src="https://github.com/user-attachments/assets/e3d08ae4-c5f4-4bcd-921a-a56703ec0d0f" />

<img width="1584" height="1023" alt="Screenshot From 2025-10-24 22-38-06" src="https://github.com/user-attachments/assets/3a777d5c-5e08-4bf6-a6ab-c4723b40935c" />

<img width="1159" height="739" alt="Screenshot From 2025-10-24 22-36-50" src="https://github.com/user-attachments/assets/a2a299e0-e032-4154-b87a-b2b48f4bf091" />
