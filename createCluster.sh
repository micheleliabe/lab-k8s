#!/bin/sh

#Cria o cluster Lab
kind create cluster --config kind-config.yaml

#Cria o namespace metallb-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml

#Aplica o manifesto do metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml

#Verificar intervalo de ips da rede
# docker network inspect -f '{{.IPAM.Config}}' kind 

#Configura o metalllb
  #Antes de executar o proximo comando, edite o arquivo metallb-configmap.yaml fornecendo range de IPs
kubectl apply -f metallb-configmap.yaml


#Instala o controlador de ingresso do Nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

