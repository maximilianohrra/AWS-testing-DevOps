# Creacion del cluster ECS
resource "aws_ecs_cluster" "default" {
    name = "${var.ecs_cluster_name}"
}

# Creacion de la ECS Task Definition 
resource "aws_ecs_task_definition" "task" {
  family                   = "wordpress"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"
 
  container_definitions = <<DEFINITION
[
  {
    "cpu": ${var.fargate_cpu},
    "image": "${var.docker_image}",
    "memory": ${var.fargate_memory},
    "name": "app",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.app_port},
        "hostPort": ${var.app_port}
      }
    ]
  }
]
DEFINITION
}
##

# Creacion ECS service
resource "aws_ecs_service" "wp-ecs-svc" {
    name = "wp-ecs-service-tf"
    cluster = "${aws_ecs_cluster.default.id}"
    task_definition = "${aws_ecs_task_definition.task.arn}"
    desired_count = 1
    launch_type = "FARGATE"

    #iam_role = 
    network_configuration {
    subnets            =  ["${aws_subnet.wp-public-tf.id}", "${aws_subnet.wp-private-tf.id}"]
    security_groups    = ["${aws_security_group.wp-elb-tf.id}"]
    assign_public_ip = "true"
  }


}