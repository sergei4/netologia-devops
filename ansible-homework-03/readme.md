# Настрока LightHouse и сервера NGinx

## Установка NGINX

### Параметры
hosts: lighthouse<br>
become: true<br>
Теги: nginx

### Хэндлеры
start-nginx<br>
Запускает Nginx

reload-nginx<br>
Перезапускает Nginx

### Задачи
* NGINX | Install epel-release<br>
  Устанавливает epel-release
* NGINX | Install nginx<br>
  Устанавливает nginx
* NGINX | Create config<br>
  Настраивает конфигурацию nginx по шаблону `nginx.conf.j2`  

## Установка LightHouse

### Параметры
hosts: lighthouse<br>
become: true<br>
Теги: lighthouse

### Хэндлеры
reload-nginx<br>
Перезапускает Nginx

### Предварительные задачи
* Lighthouse | Install git<br>
  Установка git

### Задачи
* Lighthouse | Create site directory<br>
  Создание директории для lighthouse
* Lighthouse | Install from git<br>
  Загрузка lighthouse из git пепозитория
* Lighthouse | Create config<br>
  Настройка сайта lighthouse по шаблону `lighthouse.conf.j2`
* Lighthouse | Confgiure SELinux context<br>
  Добавление прав доступа к директории lighthouse
* Lighthouse | Apply SELinux context<br>
  Применение конфигурации доступа
  
