# this project is a web server that provides dynamic search for local files.
# it uses angularjs on the client-side and nodejs on the server-side.
# the client has a searchbox to search for local html docs inside the public folder.
# on each typped letter, the search engine will filter results dynamically and locally to provide best performance

# option 1 - build and deploy with terraform (local docker provider)

$ cd terraform-docker
$ terraform init
$ terraform validate
$ terraform plan
$ terraform apply ### to destroy the deployment, use 'terraform destroy'.

# option 2 - using raw docker commands
to start as local docker, modify the ./build-and-start.sh script with the APP_NAME to appear on the website title.
then run the script (NOTE ! each time you run the script it DESTROYS the old deployment and replace with a new one.
for production use, u will want to avoid this behaviour and create a better start script.

# option 3 - deploy to ec2 and run as a single docker container using cloud-init
# 1. create users/groups on the new ec2 instance
# 2. inject ssh public key, so we can connect with our private key (without aws keypair)
# 3. install docker
# 4. clone the project from github
# 5. build the image
# 6. start a container
 
1. create keys to inject the public into the new instance
$ ssh-keygen -t rsa -C "your_email@example.com" -f ./tf-cloud-init

$ cd terraform-aws
$ terraform init
$ terraform validate
$ terraform plan
$ terraform apply ### to destroy the deployment, use 'terraform destroy'.

         



after launching the container, browse to http://localhost, then type 'a' in the searchbox to see local files in ./public folder

