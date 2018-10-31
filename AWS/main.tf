provider "aws"{
 region="${var.aws_region}"
}

#Deploy storage

module "storage" {
 source="./Storage"
 project_name="${var.project_name}"
}

#Deploy networking
module "networking"{
    source="./Networking"
    vpc_cidr="${var.vpc_cidr}"
    public_cidrs="${var.public_cidrs}"
    accessip= "${var.accessip}"
}
#Deploy compute
module "compute" {
    source="./Compute"
    instance_count  = "${var.instance_count}"
    key_name        = "${var.key_name}"
    public_key_path = "${var.public_key_path}"
    instance_type   = "${var.server_instance_type}"
    subnets         = "${module.networking.public_subnets}"
    security_group  = "${module.networking.public_sg}"
    subnet_ips      = "${module.networking.subnet_ips}"
    
}