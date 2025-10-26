### Задача №1
https://hub.docker.com/repository/docker/mobicode/custom-nginx/general

### Задача №2
![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

### Задача №3

```
docker attach custom-nginx
```
Контенер остановился, потому что с помощью attch мы подключились с основному процессу контейнера (pid 1) и при Ctrl+C мы его завершили.

![alt text](image-6.png)

Внутри контейнера мы изменили порт с 80 на 81, на котором работает nginx, но настройки контейнера по мапингу портов 8080 -> 80 не поменялись, поэтому сервер ngix стал не доступен.

### Задача №4 

![alt text](image-7.png)

### Задача №5 

Docker compose поддерживает оба файла compose.yaml и docker-compose.yaml (для совместимости со старыми версиями), но будет запуска compose.yaml, если в каталоге находятся оба

![alt text](image-8.png)

![alt text](image-9.png)

![alt text](image-10.png)

![alt text](image-11.png)

![alt text](image-12.png)

Предупреждение означает, что есть контейнеры которые были созданы через docker-compose файл, но о них нет упоминания, но они продолжают работать. Чтобы остановить их нужно выполнить команду
```
docker-compose down --remove-orphans
```

![alt text](image-13.png)

![alt text](image-14.png)

![alt text](image-15.png)