# Домашнее задание к занятию «Кластеры. Ресурсы под управлением облачных провайдеров»

## Задание 1.1. Yandex Cloud: кластер MySQL

Terraform-конфигурация находится в каталоге [src](src)

Запуск:

```bash
cd cloud-04/src
terraform init
terraform validate
terraform plan
terraform apply
```

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

## Задание 1.2. Yandex Cloud: кластер Kubernetes

Terraform-конфигурация находится в каталоге [src](src)

![alt text](image-6.png)

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)

## Задание 1.2*. phpMyAdmin

```bash
kubectl -n phpmyadmin create secret generic phpmyadmin-secret --from-literal=PMA_PASSWORD="..."
```

Манифест phpMyAdmin находится в [k8s/phpmyadmin.yaml](k8s/phpmyadmin.yaml).


```bash
kubectl apply -f cloud-04/k8s/phpmyadmin.yaml
```

```bash
kubectl -n phpmyadmin get all
kubectl -n phpmyadmin port-forward service/phpmyadmin 18080:80
```

![alt text](image-10.png)

![alt text](image-11.png)

