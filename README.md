## Comandos importantes:

touch Dockerfile

nano Dockerfile

touch deploy.sh

nano deploy.sh

aws ecr create-repository --repository-name lambda-final

aws ecr create-repository --repository-name lambda-final

docker build --platform linux/amd64 --provenance=false -t lambda-final .

docker tag lambda-final:latest <ECR_URI>:latest

docker push <ECR_URI>:latest

./deploy.sh
