#!/bin/sh

python manage.py migrate --no-input
python manage.py collectstatic --no-input

gunicorn survey.wsgi:application --bind 0.0.0.0:8888


#---------------------------------------------------------
# Запустить после старта для создания админ пользователя:
# docker container exec -it survey_web_1 ./manage.py createsuperuser
# Сделали перенос и востановление из бэкапа, запускать не надо!!!
#---------------------------------------------------------


