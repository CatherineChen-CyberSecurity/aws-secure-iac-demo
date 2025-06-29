include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  env = basename(path_relative_to_include())
}

terraform {
  source = "../../modules/s3-bucket"
}

inputs = {
  bucket_name = "secure-demo-bucket-${local.env}"
  environment = local.env
}