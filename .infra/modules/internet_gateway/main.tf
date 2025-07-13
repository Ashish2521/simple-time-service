resource "aws_internet_gateway" "timerservice_igw" {
    vpc_id = var.vpc_id
    tags = {
        Name = "${var.name}-igw"
    }
}