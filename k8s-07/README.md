# Задача 1

Создаем отдельный namespace для **demo-app**

```bash
kubectl create ns demo-app
```

```bash
helm template .
```

![alt text](image.png)

![alt text](image-1.png)

```bash
helm upgrade -i demo-app-dev . -n demo-app
```

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

![alt text](image-6.png)

контейнер не создался т.к. нет такого образа

![alt text](image-7.png)

![alt text](image-8.png)

после скачивания образа остается новый контейнер для frontend. контейр для backend не поменялся

![alt text](image-9.png)

![alt text](image-10.png)

# Задача 2

![alt text](image-11.png)

запускаем dev и prod с переопределенными параметрами в app1

![alt text](image-12.png)

![alt text](image-13.png)

запускаем dev в app2

![alt text](image-14.png)

![alt text](image-15.png)