# Домашнее задание к занятию «Организация сети»

Установка Nat и Public VM

![alt text](images/image.png)

![alt text](images/image-4.png)

![alt text](images/image-1.png)

![alt text](images/image-2.png)

Доступ у Nat и Internet для Public VM

![alt text](images/image-3.png)

Установка Private VM

![alt text](images/image-11.png)

![alt text](images/image-6.png)

![alt text](images/image-7.png)

Ping с Public VM на Private VM

![alt text](images/image-8.png)

Настройка группы безопасности

![alt text](images/image-9.png)

![alt text](images/image-10.png)

Подключение к Private VM через Public VM

```
ssh -i ~/.ssh/yc-ssh-key-1759848858263 -o ProxyCommand="ssh -i ~/.ssh/yc-ssh-key-1759848858263 -W %h:%p ubuntu@111.88.248.97" ubuntu@192.168.20.29
```

![alt text](images/image-12.png)

