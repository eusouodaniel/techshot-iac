resource "aws_apprunner_service" "credit-talk" {
  service_name = "${var.app_runner_service_name}"

  observability_configuration {
    observability_configuration_arn = aws_apprunner_observability_configuration.credit-talk.arn
    observability_enabled           = true
  }

  source_configuration {
    image_repository {
      image_configuration {
        port = "80"
      }
      image_identifier      = "${var.app_runner_image_repository}"
      image_repository_type = "${var.app_runner_image_type}"
    }
    auto_deployments_enabled = false
  }

  tags = {
    Name = "${var.app_runner_service_name}-apprunner-service"
    TF   = true
  }
}

resource "aws_apprunner_observability_configuration" "credit-talk" {
  observability_configuration_name = "${var.app_runner_service_name}"

  trace_configuration {
    vendor = "AWSXRAY"
  }

  tags = {
    Name = "${var.app_runner_service_name}-apprunner-observability"
    TF   = true
  }
}