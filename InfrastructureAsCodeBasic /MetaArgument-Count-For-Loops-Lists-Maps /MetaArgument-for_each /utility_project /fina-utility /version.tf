#terraform block
terraform {
  required_version = "~> 1.11.4"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
    }
  }
# provider Block - the provider name aws has to match with required_providers in the terraform block
provider "aws" {
  region = "us-east-1"
  profile = "default" 
}
/*Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
