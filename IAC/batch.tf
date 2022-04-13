module "batch_fargate" {
  source = "git::https://github.com/Zillions-Trading-Bots/example_batch.git//modules/batch"

  app_name                      = var.app_name
  service_name                  = var.service_name
  aws_region                    = var.aws_region
  tags                          = var.tags
  job_definition_image_full_url = var.job_definition_image_full_url
}


