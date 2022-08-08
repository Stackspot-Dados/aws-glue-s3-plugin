{% if inputs.creation_decision == 'Padrão'%}

# Bucket data-sor
resource "aws_s3_bucket" "data-sor" {
     bucket = "${data.aws_caller_identity.current.account_id}-data-sor"
}

resource "aws_s3_bucket_notification" "data-sor_notification" {
    bucket = aws_s3_bucket.data-sor.id 
    eventbridge = true
}

resource "aws_s3_bucket_public_access_block" "data-sor_policy" { 
    bucket = aws_s3_bucket.data-sor.id 
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "data-sor_policy" { 
    bucket = aws_s3_bucket.data-sor.id 
    policy = data.aws_iam_policy_document.data-sor_policy.json
}
data "aws_iam_policy_document" "data-sor_policy" { 
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
            resources = [ aws_s3_bucket.data-sor.arn,"${aws_s3_bucket.data-sor.arn}/*",] 
        }
}

# Bucket data-sot
resource "aws_s3_bucket" "data-sot" {
     bucket = "${data.aws_caller_identity.current.account_id}-data-sot"
}

resource "aws_s3_bucket_notification" "data-sot_notification" {
    bucket = aws_s3_bucket.data-sot.id 
    eventbridge = true
}

resource "aws_s3_bucket_public_access_block" "data-sot_policy" { 
    bucket = aws_s3_bucket.data-sot.id 
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "data-sot_policy" { 
    bucket = aws_s3_bucket.data-sot.id 
    policy = data.aws_iam_policy_document.data-sot_policy.json
}
data "aws_iam_policy_document" "data-sot_policy" { 
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
            resources = [ aws_s3_bucket.data-sot.arn,"${aws_s3_bucket.data-sot.arn}/*",] 
        }
}

# Bucket data-spec

resource "aws_s3_bucket" "data-spec" {
     bucket = "${data.aws_caller_identity.current.account_id}-data-spec"
}

resource "aws_s3_bucket_notification" "data-spec_notification" {
    bucket = aws_s3_bucket.data-spec.id 
    eventbridge = true
}

resource "aws_s3_bucket_public_access_block" "data-spec_policy" { 
    bucket = aws_s3_bucket.data-spec.id 
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "data-spec_policy" { 
    bucket = aws_s3_bucket.data-spec.id 
    policy = data.aws_iam_policy_document.data-spec_policy.json
}
data "aws_iam_policy_document" "data-spec_policy" { 
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
            resources = [ aws_s3_bucket.data-spec.arn,"${aws_s3_bucket.data-spec.arn}/*",] 
        }
}

# data-script
resource "aws_s3_bucket" "data-script" { 
    bucket = "${data.aws_caller_identity.current.account_id}-data-script" 
}
resource "aws_s3_bucket_public_access_block" "data-script_policy" {
    bucket = aws_s3_bucket.data-script.id 
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}
resource "aws_s3_bucket_policy" "data-script_policy" { 
    bucket = aws_s3_bucket.data-script.id 
    policy = data.aws_iam_policy_document.data-script_policy.json
}
data "aws_iam_policy_document" "data-script_policy" { 
    statement { 
        principals { 
            type = "AWS" 
            dentifiers = ["arn:aws:iam::${var.account_id_tools}:root","arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"] } 
            actions = [ 
                "s3:ListBucket",
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
    resources = [ aws_s3_bucket.data-script.arn,"${aws_s3_bucket.data-script.arn}/*",] }
}


# data-athena-output 

resource "aws_s3_bucket" "data-athena-output" {
    bucket = "${data.aws_caller_identity.current.account_id}-data-athena-output" 
}

resource "aws_s3_bucket_public_access_block" "data-athena-output_policy" { 
    bucket = aws_s3_bucket.data-athena-output.id 
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "data-athena-output_policy" { 
    bucket = aws_s3_bucket.data-athena-output.id 
    policy = data.aws_iam_policy_document.data-athena-output_policy.json
}

data "aws_iam_policy_document" "data-athena-output_policy" { 
    statement { 
        principals { 
            type = "AWS" 
            identifiers = [
                "arn:aws:iam::${var.account_id_tools}:root",
                "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
            ]
        } 
        actions = [ 
            "s3:ListBucket",
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
        resources = [ aws_s3_bucket.data-athena-output.arn,"${aws_s3_bucket.data-athena-output.arn}/*", ] 
    }
}
{% endif %}