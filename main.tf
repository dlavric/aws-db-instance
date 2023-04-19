terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.63.0"
    }
  }
}

provider "aws" {
 region = "eu-central-1"
}

resource "aws_db_instance" "default" {
  allocated_storage         = 10
  db_name                   = "mydb"
  engine                    = "postgres"
  engine_version            = "12"
  instance_class            = "db.t3.micro"
  username                  = "foo"
  password                  = "foobarbaz"
  parameter_group_name      = "default.postgres12"
  skip_final_snapshot       = true
  final_snapshot_identifier = "final"
}

output "final_snapshot_identifier" {
  value = aws_db_instance.default.final_snapshot_identifier
}


