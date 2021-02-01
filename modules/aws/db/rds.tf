resource "aws_rds_cluster" "RDS" {
    availability_zones = var.avail_zones
    database_name = "${var.db_name}"
    deletion_protection = var.deletion_protect
 
    cluster_identifier = "${var.profile}-${var.cluster_identifier}"
    db_subnet_group_name = aws_db_subnet_group.RDSsubnetgroup.name

    vpc_security_group_ids = var.security_groups
    engine = var.engine_type
    port = var.db_port

    master_username = var.name
    master_password = var.password

    storage_encrypted = false
    engine_version = var.engine_version
    engine_mode = var.engine_mode
}

resource "aws_db_subnet_group" "RDSsubnetgroup" {
    name = "${var.profile}-subnet-group"
    subnet_ids = var.subnets
    description = "RDS_subnet_group"
}

