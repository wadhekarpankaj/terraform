#Storage/main.tf

#Create a random ID
resource "random_id" "tf_bucket_id" {
    byte_length = 4
}

#Create s3 bucker

resource "aws_s3_bucket" "tf_code" {
    bucket= "${var.project_name}-${random_id.tf_bucket_id.dec}"
    acl= "private"
    force_destroy= true
        tags{
            name="tf_bucket"
        }
}

