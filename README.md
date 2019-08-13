# README

**Assumptions:**

1. This API is public API.

2. No Version for this API.

3. Two Tables only will be in DB, Images uploaded by user, and Transferred Images result of transformation.

4. No Validation for the Image Size. This one will set depend on the service will be free version for Users or Premium version.

5. Some images only valid `jpg|jpeg|png|gif`

**Clone & Installment:**

* Ruby Version: 2.6.3

* Rails Version: 5.2.2

* Database Type: PostgreSQL.

* After Clone, add S3 Setting by the following: `EDITOR="vim" rails credentials:edit`, then add:

```
aws:
        AWS_REGION: us-east-1
        AWS_ACCESS_KEY_ID: XXXXX
        AWS_SECRET_ACCESS_KEY: XXXXX
        AWS_BUCKET: files
        AWS_URL: files.s3-website-us-east-1.amazonaws.com

```

**Explanation:**

* Upload & Delete Images by `paperclip` gem & Integrate with S3.

* Use `mini_magick` for transformation of images.

* User upload normal image, it'll be uploaded in `progimg` folder inside S3 Bucket. And for transferred images will be uploaded in `tranferred_progimg`.

**TO DO:**

* Depend on Users will use the transformation on production server, we can use background tasks or cron tab processes.

- Delayed Job for upload & transfer images.

* Type more test cases for test all versions of all images.

* In Deployment, we can deploy two versions Free Version for public Users & Premium Versions for paid clients.

