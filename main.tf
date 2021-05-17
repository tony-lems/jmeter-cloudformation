provider "aws" {
  region = var.region
  #TODO parametrize provider if possible (GCP, Azure, AWS)
}

module "jmeter_cluster" {
  source = "github.com/tony-lems/jmeter-cloudformation"

}
