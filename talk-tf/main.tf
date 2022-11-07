module "app-runner" {
  source                        = "./modules/app-runner"
  app_runner_service_name       = var.app_runner_service_name
  app_runner_image_repository   = var.app_runner_image_repository
  app_runner_image_type         = var.app_runner_image_type
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.s3_name_tf_state}"
     
  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = {
    Name = "${var.s3_name_tf_state}-s3-bucket"
    TF   = true
  }
}