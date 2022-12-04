#!/bin/bash
source /book_env/bin/activate
cd /code

echo "----- Collect static files ------ " 
python manage.py collectstatic --noinput

echo "-----------Apply migration--------- "
python manage.py makemigrations 
python manage.py migrate

echo "--------Redis channel--------"
docker run -p 6378:6379 -d redis:5

echo "-----------Run gunicorn--------- "
gunicorn -b :8000 chatProj.wsgi:application