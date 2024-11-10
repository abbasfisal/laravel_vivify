# install
- 1 clone project
- 2 cp .env.example .env
- 3 docker-compose up -d --build
- 4 docker exec -it php sh
- 5 inside bash => composer install && php artisan key:generate =>then exit

``
یک باگی هست:  نباید نیازی به نصب کامپوزر به صورت دستی داشته باشیم که داریم / دستور نصب کامپوزر موجود درون داکرفایل باعث نصب میشه اما بازم مجبور هستیم نصب کنیم 
``
