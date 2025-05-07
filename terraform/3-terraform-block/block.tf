terraform {
    required_version = "1.7.0"
    //required_version = ">1.5.0, <1.7.0"

    backend "s3" {
        // ...
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.33.0" // allows only the rightmost digit to increment (e.g., the minor version here is allowed to increment)
        }
    }
}