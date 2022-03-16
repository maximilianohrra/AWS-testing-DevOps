# AWS-junior-DevOps
Reto Junior Devops Engineer Bkool 


# ¿Qué he hecho?
Para crear la imagen de Wordpress y automatizar la implementación en AWS, utilicé varias herramientas y componentes de infraestructura,

Terraform se utilizó para el despliegue de la infraestructura, más específicamente:

Clúster ECS (Fargate)
Definición de tareas de ECS
Servicio ECS
Grupos de seguridad EC2
RDS - MYSQL

# ¿Cómo ejecutarlo?
Una vez que se actualizan las variables y las claves, la infraestructura se puede implementar ejecutando los comandos terraform init , terraform plan y terraform apply desde dentro del directorio de terraform.

# ¿Qué problemas enfrenté?
Algunos de los problemas que he enfrentado durante el desarrollo incluyen:


La tarea de ECS no se ejecuta con DETENIDO (CannotPullContainerError). El motivo de este error es que la tarea no tiene conectividad de salida para obtener la imagen (verifique los SG) o que el nombre de la imagen especificado en la tarea no coincide con el de ECR.

La tarea de ECS no se ejecuta con el error DETENIDO. 
La razón de esto probablemente esté relacionada con problemas de conexión RDS.

No se puede acceder a la página de Wordpress. E
nfrenté este error cuando probé localmente y el motivo fue la configuración de la base de datos de Wordpress.
IAM rol para crear el Load Balancer, esta es, todavía, la duda en la implementacion que me queda.
Desde ya, toda la experiencia me ha animado a continuar afianzando conocimientos respecto de AWS y sus PAAS, así como tambien de Terraform. Entiendo que sigo aprendiendo y conociendo más acerca de la automatización y el despliegue de aplicaciones con IaC.


Quedo atento a cualquier duda o consulta. 
Y muchas gracias por la oportunidad, tiempo y dedicación.

Cordial Saludo,

Maximiliano.
