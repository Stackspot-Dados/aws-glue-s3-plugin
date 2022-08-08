# Bucket {{inputs.bucket_name}}

resource "aws_s3_bucket" "{{inputs.bucket_name}}" {
     bucket = "${data.aws_caller_identity.current.account_id}-{{inputs.bucket_name}}"
}

resource "aws_s3_bucket_notification" "{{inputs.bucket_name}}_notification" {
    bucket = aws_s3_bucket.{{inputs.bucket_name}}.id 
    eventbridge = true
}

resource "aws_s3_bucket_public_access_block" "{{inputs.bucket_name}}_policy" { 
    bucket = aws_s3_bucket.{{inputs.bucket_name}}.id 
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "{{inputs.bucket_name}}_policy" { 
    bucket = aws_s3_bucket.{{inputs.bucket_name}}.id 
    policy = data.aws_iam_policy_document.{{inputs.bucket_name}}_policy.json
}
data "aws_iam_policy_document" "{{inputs.bucket_name}}_policy" { 
    statement { 
        principals {
            type = "AWS" 
            identifiers = ["arn:aws:iam::${var.account_id_tools}:root", "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"] }
            actions = [ 
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation",
                "s3:GetBucketPolicy",
                "s3:GetBucketVersioning",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:ListBucketMultipartUploads",
                "s3:PutAccelerateConfiguration",
                "s3:PutBucketAcl",
                "s3:PutBucketPolicy",
                "s3:AbortMultipartUpload",
                "s3:DeleteObject",
                "s3:DeleteObjectVersion",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:GetObjectVersion",
                "s3:ListMultipartUploadParts",
                "s3:PutObject",
                "s3:PutObjectAcl" 
            ] 
            resources = [ aws_s3_bucket.{{inputs.bucket_name}}.arn,"${aws_s3_bucket.{{inputs.bucket_name}}.arn}/*",] 
        }
}
