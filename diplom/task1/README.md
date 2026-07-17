## Создание облачной инфраструктуры

Иструменты:
* terraform cli
* yc cli 

Создаем сервисный аккаунт `terraform-sa` в YC

![alt text](image.png)

| Роль | Для чего нужна |
|---|---|
| `vpc.admin` | Создание и удаление VPC, подсетей, таблиц маршрутизации, публичных адресов и групп безопасности |
| `storage.editor` | Чтение и запись Terraform state в Object Storage |
| `compute.admin` | Создание, изменение и удаление виртуальных машин, дисков и групп ВМ |
| `load-balancer.admin` | Создание Yandex Network Load Balancer |
| `alb.admin` | Создание Yandex Application Load Balancer |

Создаем ключ доступа IAM и копируем в папку ~/.config/yandex-cloud/keys/terraform-sa-key.json

![alt text](image-1.png)


Создаем ключ доступа для S3 backet

![alt text](image-2.png)

![alt text](image-3.png)

### Создание S3

Terratorm настройки в папке `bootstrap`

```bash
terraform init
terraform apply
```

![alt text](image-4.png)

### Создание инфраструктуры

Terratorm настройки в папке `infrastructure`

Создаем файл `backend.env` 
```
export AWS_ACCESS_KEY_ID="YC***"
export AWS_SECRET_ACCESS_KEY="YC***"
```
Активируем переменные в сеансе и подключаем backend
```bash
source ./backend.env
terraform init -backend-config=backend.hcl
```

Настраиваем инфраструктуру
```bash
terraform apply
```