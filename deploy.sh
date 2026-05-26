#!/bin/bash

ACCOUNT_ID=382888552340
REGION=us-east-1
REPOSITORY=lambda-final

echo "Construyendo imagen..."
docker buildx build --platform linux/amd64 --load -t $REPOSITORY .

echo "Etiquetando imagen..."
docker tag $REPOSITORY:latest \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:latest

echo "Autenticando con ECR..."
aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Subiendo imagen..."
docker push \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:latest

echo "Imagen publicada correctamente"
