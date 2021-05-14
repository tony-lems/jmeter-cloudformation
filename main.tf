provider "aws" {
  region = var.region
  #TODO parametrize provider if possible (GCP, Azure, AWS)
}

module "jmeter_cluster" {
  source = "github.com/tony-lems/jmeter-cloudformation"

  # TODO configure the number of instances (param from CLI?)

  # TODO create a UI app to pass needed param to the terraform. (Optional)
}