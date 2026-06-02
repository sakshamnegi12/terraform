module "EDMS-dev" {
    source = "./infra-app"
    env= "dev"
    bucket_name = "edmsapplication9875657"
    dynamodbtable_name = "EDMS-Table"
    dynamodb_hashkey = "StudentID"
    key_name = "EDMS-KEY"
    sg_name = "EDMS-SG"
    instance_count = 1
    ami_id = "ami-05d2d839d4f73aafb"
    volume_size = 10
    instance_name = "EDMS-APP"
    instance_type = "t2.small"
}

module "EDMS-Stage" {
    source = "./infra-app"
    env= "stage"
    bucket_name = "edmsapplication987rg5657"
    dynamodbtable_name = "EDMS-Table"
    dynamodb_hashkey = "StudentID"
    key_name = "EDMS-KEY"
    sg_name = "EDMS-SG"
    instance_count = 1
    ami_id = "ami-05d2d839d4f73aafb"
    volume_size = 20
    instance_name = "EDMS-APP"
    instance_type = "t2.medium"
}

module "EDMS-Prod" {
    source = "./infra-app"
    env = "prod"
    bucket_name = "edmsapplication4567654fb"
    dynamodbtable_name = "EDMS-Table"
    dynamodb_hashkey = "StudentID"
    key_name = "EDMS-KEY"
    sg_name = "EDMS-SG"
    instance_count = 2
    ami_id = "ami-05d2d839d4f73aafb"
    volume_size = 30
    instance_name = "EDMS-APP"
    instance_type = "t2.large"
}