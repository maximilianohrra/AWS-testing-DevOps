# DNS del LB
output "elb_dns" {
    value = "${aws_elb.default.dns_name}"
}


# HOST DB ENDPOINT
output "db_host" {
    value = "${aws_db_instance.wordpress.endpoint}"
}