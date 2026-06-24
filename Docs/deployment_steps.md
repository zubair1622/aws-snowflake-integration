# Deployment Steps

# AWS Snowflake Integration

Version: 1.0
Author: Mohammed Zubair Siddiqui

---

# 1. Introduction

This document provides step-by-step instructions for deploying the AWS Snowflake Integration solution.

The deployment includes:

* IAM role configuration
* S3 configuration
* Storage Integration
* External Stage creation
* Data loading into Snowflake

---

# 2. Prerequisites

Before deployment, ensure the following are available:

* AWS Account
* Snowflake Account
* ACCOUNTADMIN privileges
* Amazon S3 access
* IAM permissions

---

# 3. Create IAM Role

Create an IAM role.

Configuration:

* Trusted Entity Type: AWS Account
* External ID: Enabled

Assign the following permissions:

* AmazonS3ReadOnlyAccess

Copy the IAM Role ARN.

This ARN will be required in Snowflake.

---

# 4. Create Amazon S3 Bucket

Create an S3 bucket.

Recommended settings:

* Block Public Access: Enabled
* Versioning: Enabled
* Server-Side Encryption: Enabled

Example structure:

```text
data-files/
```

Upload sample files.

---

# 5. Login to Snowflake

Connect to Snowflake using an account with ACCOUNTADMIN privileges.

Activate:

```sql
USE ROLE ACCOUNTADMIN;
```

---

# 6. Create Storage Integration

Create a Storage Integration object.

Configuration includes:

* IAM Role ARN
* Allowed S3 locations
* External authentication

Validate the integration.

---

# 7. Describe Integration

Execute:

```sql
DESC INTEGRATION integration_name;
```

Retrieve:

* STORAGE_AWS_IAM_USER_ARN
* STORAGE_AWS_EXTERNAL_ID

These values will be used within AWS.

---

# 8. Update IAM Trust Policy

Modify the IAM Role trust relationship.

Add:

* Snowflake IAM User ARN
* External ID

Update the policy.

This establishes secure communication between AWS and Snowflake.

---

# 9. Create File Format

Create a Snowflake file format.

Example configurations:

* CSV delimiter
* Header handling
* Text qualifiers

Validate the file format.

---

# 10. Create External Stage

Create an external stage.

Configuration includes:

* S3 URL
* Storage Integration
* File Format

Validate stage access.

---

# 11. Create Target Table

Create the destination table.

The schema should match the source data.

Example columns:

* Identifier
* Name
* Date columns

---

# 12. Execute COPY INTO

Load data into Snowflake using:

* External Stage
* File Format
* COPY INTO command

Verify successful execution.

---

# 13. Validate Data

Execute validation queries.

Examples:

* Row count validation
* Sample record validation
* Null checks

Ensure data was loaded correctly.

---

# 14. Monitor Loading

Monitor:

* Query History
* COPY INTO results
* Load statistics

Review failed records if necessary.

---

# 15. Troubleshooting

| Issue                | Resolution           |
| -------------------- | -------------------- |
| Invalid IAM role     | Verify ARN           |
| Access denied        | Check trust policy   |
| Stage access failure | Validate integration |
| COPY INTO failure    | Verify file format   |
| Missing files        | Check S3 path        |

---

# 16. Security Validation

Verify:

* No AWS keys stored in Snowflake.
* Least privilege permissions.
* Valid External ID.
* Proper trust relationship.

---

# 17. Cleanup

After testing:

* Remove test files.
* Disable unused roles.
* Delete temporary objects.

This helps reduce operational costs.

---

# 18. Future Enhancements

Future improvements may include:

* Snowpipe implementation
* Continuous ingestion
* Event-driven loading
* Monitoring dashboards
* Automated validation

---

# 19. Conclusion

Following these deployment steps enables secure and scalable integration between Amazon S3 and Snowflake using IAM roles, Storage Integration, and External Stages.

