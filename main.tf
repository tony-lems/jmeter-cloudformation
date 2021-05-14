provider "aws" {
  region = var.region
}

module "jmeter_cluster" {
  source = "github.com/tony-lems/jmeter-cloudformation"
  
}